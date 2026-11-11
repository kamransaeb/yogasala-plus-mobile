import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/widgets/feedback/app_flushbar.dart';
import 'package:yogasala_plus_mobile/core/widgets/feedback/failure_view.dart';
import 'package:yogasala_plus_mobile/errors/error_mapper.dart';
import 'package:yogasala_plus_mobile/features/subscriptions/presentation/bloc/paywall_bloc.dart';
import 'package:yogasala_plus_mobile/features/subscriptions/presentation/widgets/paywall_plan_card.dart';

/// Paywall body: STANDARD / PREMIUM packages + restore.
class PaywallForm extends StatelessWidget {
  /// Creates a [PaywallForm].
  const PaywallForm({super.key});

  @override
  Widget build(BuildContext context) {
    context.locale;

    return BlocConsumer<PaywallBloc, PaywallState>(
      listenWhen: (previous, current) =>
          previous.failureOrNull != current.failureOrNull ||
          previous.actionFailureOrNull != current.actionFailureOrNull ||
          previous.purchaseCompleted != current.purchaseCompleted ||
          previous.restoreCompleted != current.restoreCompleted,
      listener: (context, state) {
        final failure = state.failureOrNull ?? state.actionFailureOrNull;
        if (failure != null) {
          if (!ErrorMapper.isPurchaseCancelled(failure)) {
            AppFlushbar.showFailure(context, failure);
          }
          return;
        }

        if (state.purchaseCompleted || state.restoreCompleted) {
          AppFlushbar.showSuccess(
            context,
            state.purchaseCompleted
                ? 'purchase_success'.tr()
                : 'restore_success'.tr(),
          );
          if (context.mounted) {
            unawaited(context.router.maybePop(true));
          }
        }
      },
      builder: (context, state) {
        final showLoading = state.maybeMap(
          initial: (_) => true,
          loading: (_) => true,
          orElse: () => false,
        );
        if (showLoading) {
          return const Center(child: AppLoadingIndicator());
        }
        if (state.isFailure) {
          return FailureView(
            failure: state.failureOrNull!,
            onRetry: () =>
                context.read<PaywallBloc>().add(const PaywallEvent.fetched()),
          );
        }

        final packages = state.packagesOrEmpty;
        final highlight = state.highlightPlanOrNull;
        final busy = state.isPurchasing || state.isRestoring;
        final bottomInset = MediaQuery.paddingOf(context).bottom;

        return ListView(
          padding: EdgeInsets.fromLTRB(
            AppDimensions.p24,
            AppDimensions.p16,
            AppDimensions.p24,
            bottomInset + AppDimensions.p24,
          ),
          children: [
            Text(
              'subscription_subtitle'.tr(),
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppDimensions.p24),
            if (packages.isEmpty)
              Center(child: Text('subscription_packages_empty'.tr()))
            else
              ...packages.map((pkg) {
                final emphasized = highlight == null || pkg.plan == highlight;
                return Padding(
                  padding: const EdgeInsets.only(bottom: AppDimensions.p16),
                  child: PaywallPlanCard(
                    package: pkg,
                    emphasized: emphasized,
                    busy: busy,
                    onSubscribe: () => context.read<PaywallBloc>().add(
                      PaywallEvent.purchaseRequested(packageId: pkg.packageId),
                    ),
                  ),
                );
              }),
            const SizedBox(height: AppDimensions.p8),
            if (state.isRestoring)
              const Center(
                child: AppLoadingIndicator(size: AppLoadingSize.small),
              )
            else
              AppButton(
                variant: AppButtonVariant.text,
                label: 'restore_purchases'.tr(),
                onPressed: busy
                    ? null
                    : () => context.read<PaywallBloc>().add(
                        const PaywallEvent.restoreRequested(),
                      ),
              ),
          ],
        );
      },
    );
  }
}
