import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/enums/subscription_plan.dart';
import 'package:yogasala_plus_mobile/core/navigation/app_router.dart';
import 'package:yogasala_plus_mobile/core/widgets/feedback/app_flushbar.dart';
import 'package:yogasala_plus_mobile/core/widgets/feedback/failure_view.dart';
import 'package:yogasala_plus_mobile/errors/error_mapper.dart';
import 'package:yogasala_plus_mobile/features/app/presentation/bloc/app_bloc.dart';
import 'package:yogasala_plus_mobile/features/live_sessions/presentation/bloc/live_sessions_bloc.dart';
import 'package:yogasala_plus_mobile/features/live_sessions/presentation/widgets/live_session_list_tile.dart';
import 'package:yogasala_plus_mobile/features/live_sessions/presentation/widgets/live_sessions_month_calendar.dart';
import 'package:yogasala_plus_mobile/features/subscriptions/presentation/bloc/entitlements_bloc.dart';

/// Live sessions list with day calendar, join / upgrade CTAs.
class LiveVideosForm extends StatelessWidget {
  /// Creates a [LiveVideosForm].
  const LiveVideosForm({super.key});

  @override
  Widget build(BuildContext context) {
    context.locale;
    final locale = context.watch<AppBloc>().state.locale;

    return BlocListener<EntitlementsBloc, EntitlementsState>(
      listenWhen: (previous, current) =>
          previous.hasLive != current.hasLive ||
          previous.entitlementsOrNull != current.entitlementsOrNull,
      listener: (context, _) {
        context.read<LiveSessionsBloc>().add(
              const LiveSessionsEvent.fetched(),
            );
      },
      child: BlocConsumer<LiveSessionsBloc, LiveSessionsState>(
        listenWhen: (previous, current) =>
            previous.failureOrNull != current.failureOrNull ||
            previous.actionFailureOrNull != current.actionFailureOrNull ||
            previous.joinResultOrNull != current.joinResultOrNull ||
            previous.requiresPremiumUpgrade != current.requiresPremiumUpgrade,
        listener: (context, state) async {
          if (state.requiresPremiumUpgrade) {
            await context.router.push(
              PaywallRoute(
                highlightPlan: '${SubscriptionPlan.premium.wireValue}',
              ),
            );
            if (context.mounted) {
              context.read<EntitlementsBloc>().add(
                    const EntitlementsEvent.fetched(),
                  );
            }
            return;
          }

          final join = state.joinResultOrNull;
          if (join != null) {
            final uri = Uri.tryParse(join.joinUrl.trim());
            if (uri == null) {
              AppFlushbar.showError(context, 'live_join_url_invalid'.tr());
              return;
            }
            final launched = await launchUrl(
              uri,
              mode: LaunchMode.externalApplication,
            );
            if (!launched && context.mounted) {
              AppFlushbar.showError(context, 'live_join_url_failed'.tr());
            }
            return;
          }

          final failure = state.failureOrNull ?? state.actionFailureOrNull;
          if (failure == null) return;

          // Full-page failure is rendered below; only toast soft failures.
          if (state.isFailure) return;

          if (ErrorMapper.requiresLiveAccess(failure)) {
            await context.router.push(
              PaywallRoute(
                highlightPlan: '${SubscriptionPlan.premium.wireValue}',
              ),
            );
            if (context.mounted) {
              context.read<EntitlementsBloc>().add(
                    const EntitlementsEvent.fetched(),
                  );
            }
            return;
          }

          AppFlushbar.showFailure(context, failure);
        },
        builder: (context, state) {
          final now = DateTime.now();
          final selectedDate = state.selectedDateOrNull ??
              DateTime(now.year, now.month, now.day);
          final focusedMonth = state.focusedMonthOrNull ??
              DateTime(selectedDate.year, selectedDate.month);
          final bottomInset = MediaQuery.paddingOf(context).bottom;

          if (state.isFailure && state.sessionsOrEmpty.isEmpty) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppDimensions.p24,
                    AppDimensions.p8,
                    AppDimensions.p24,
                    0,
                  ),
                  child: LiveSessionsMonthCalendar(
                    focusedMonth: focusedMonth,
                    selectedDate: selectedDate,
                  ),
                ),
                Expanded(
                  child: FailureView(
                    failure: state.failureOrNull!,
                    onRetry: () => context.read<LiveSessionsBloc>().add(
                          LiveSessionsEvent.fetched(date: selectedDate),
                        ),
                  ),
                ),
              ],
            );
          }

          final showInitialLoading = state.maybeMap(
            initial: (_) => true,
            loading: (_) => true,
            orElse: () => false,
          );
          final sessions = state.sessionsOrEmpty;
          final hasLive = context.watch<EntitlementsBloc>().state.hasLive ||
              state.hasLiveEntitlement;

          return CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(
                  AppDimensions.p24,
                  AppDimensions.p8,
                  AppDimensions.p24,
                  AppDimensions.p16,
                ),
                sliver: SliverToBoxAdapter(
                  child: LiveSessionsMonthCalendar(
                    focusedMonth: focusedMonth,
                    selectedDate: selectedDate,
                  ),
                ),
              ),
              if (showInitialLoading || state.isRefreshing)
                const SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(child: AppLoadingIndicator()),
                )
              else if (sessions.isEmpty)
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(child: Text('live_sessions_empty'.tr())),
                )
              else
                SliverPadding(
                  padding: EdgeInsets.only(
                    bottom: bottomInset > 0
                        ? bottomInset + AppDimensions.p12
                        : AppDimensions.p16 + kBottomNavigationBarHeight,
                  ),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final session = sessions[index];
                        final joining = state.isJoining &&
                            state.joiningSlotIdOrNull == session.slotId;
                        return LiveSessionListTile(
                          session: session,
                          locale: locale,
                          hasLiveEntitlement: hasLive,
                          isJoining: joining,
                          onJoin: () => context.read<LiveSessionsBloc>().add(
                                LiveSessionsEvent.joinRequested(
                                  slotId: session.slotId,
                                  occurrenceStart: session.startsAtRaw,
                                ),
                              ),
                          onUpgrade: () => unawaited(
                            context.router.push(
                              PaywallRoute(
                                highlightPlan:
                                    '${SubscriptionPlan.premium.wireValue}',
                              ),
                            ),
                          ),
                        );
                      },
                      childCount: sessions.length,
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
