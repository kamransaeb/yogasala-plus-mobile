import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/constants/app_icons.dart';
import 'package:yogasala_plus_mobile/core/navigation/app_router.dart';
import 'package:yogasala_plus_mobile/core/widgets/buttons/locale_buttons.dart';
import 'package:yogasala_plus_mobile/core/widgets/buttons/theme_toggle_button.dart';
import 'package:yogasala_plus_mobile/core/widgets/feedback/failure_view.dart';
import 'package:yogasala_plus_mobile/core/widgets/svg_icon.dart';
import 'package:yogasala_plus_mobile/di/injection.dart';
import 'package:yogasala_plus_mobile/errors/error_mapper.dart';
import 'package:yogasala_plus_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:yogasala_plus_mobile/features/points/presentation/bloc/points_bloc.dart';
import 'package:yogasala_plus_mobile/features/profile/domain/entities/user_yoga_sala_plus.dart';
import 'package:yogasala_plus_mobile/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:yogasala_plus_mobile/features/profile/presentation/widgets/profile_list_row.dart';
import 'package:yogasala_plus_mobile/features/profile/presentation/widgets/profile_user_tile.dart';

/// Profile tab: user header, points balance, my quizzes, and account actions.
@RoutePage()
class ProfilePage extends StatelessWidget {
  /// Creates a [ProfilePage].
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Tab uses maintainState: false — this rebuilds on each visit and refetches.
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              getIt<ProfileBloc>()..add(const ProfileEvent.fetched()),
        ),
        BlocProvider.value(
          value: getIt<PointsBloc>()..add(const PointsEvent.fetched()),
        ),
      ],
      child: const _ProfileView(),
    );
  }
}

class _ProfileView extends StatelessWidget {
  const _ProfileView();

  @override
  Widget build(BuildContext context) {
    // Subscribe to EasyLocalization so '.tr()' labels rebuild on locale change.
    context.locale;

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppDimensions.p24),
            child: AppButton(
              variant: AppButtonVariant.icon,
              size: AppButtonSize.large,
              label: 'logout'.tr(),
              icon: Icons.logout,
              onPressed: () {
                context.read<AuthBloc>().add(
                  const AuthEvent.logoutRequested(),
                );
              },
            ),
          ),
        ],
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, profileState) {
          final profileLoading = profileState.maybeMap(
            initial: (_) => true,
            loading: (_) => true,
            orElse: () => false,
          );
          if (profileLoading) {
            return const Center(child: AppLoadingIndicator());
          }
          if (profileState.isFailure) {
            return FailureView(
              failure: profileState.failureOrNull!,
              onRetry: () =>
                  context.read<ProfileBloc>().add(const ProfileEvent.fetched()),
            );
          }

          final user = profileState.userOrNull;
          if (user == null) {
            return const SizedBox.shrink();
          }

          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.p24,
                ),
                child: ProfileUserTile(user: user),
              ),
              const ProfileSectionDivider(),
              const _PointsRow(),
              const ProfileSectionDivider(),
              const _BadgesSection(),
              const ProfileSectionDivider(),
              ProfileListRow(
                icon: AppIcons.quiz,
                label: 'my_quizzes'.tr(),
                onTap: () => context.router.push(const QuizAttemptsRoute()),
              ),
              const ProfileSectionDivider(bottomMargin: AppDimensions.p6),

              ProfileListRow(
                icon: AppIcons.theme,
                label: 'theme'.tr(),
                trailing: const ThemeToggleButton(
                  padding: EdgeInsets.symmetric(
                    vertical: AppDimensions.p4,
                  ),
                ),
              ),

              const ProfileSectionDivider(
                topMargin: AppDimensions.p6,
                bottomMargin: AppDimensions.p6,
              ),

              ProfileListRow(
                icon: AppIcons.language,
                label: 'language'.tr(),
                trailing: const LocaleButtons(),
              ),
              const ProfileSectionDivider(
                topMargin: AppDimensions.p6,
              ),

              const _PrivacyPolicyRow(),
              const ProfileSectionDivider(),
              const _TermsOfServiceRow(),
              const ProfileSectionDivider(),

              _PaymentsRow(user: user),
              const ProfileSectionDivider(),
              _RateUsRow(user: user),
              const ProfileSectionDivider(),
              _ProfileInfoRow(user: user),
              const ProfileSectionDivider(),
            ],
          );
        },
      ),
    );
  }
}

class _PointsRow extends StatelessWidget {
  const _PointsRow();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PointsBloc, PointsState>(
      builder: (context, pointsState) {
        final pointsLoading = pointsState.maybeMap(
          initial: (_) => true,
          loading: (_) => true,
          orElse: () => false,
        );
        if (pointsLoading) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: AppDimensions.p24),
            child: Center(child: AppLoadingIndicator()),
          );
        }
        if (pointsState.isFailure) {
          return Column(
            children: [
              Text(
                ErrorMapper.toUserMessage(pointsState.failureOrNull!),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppDimensions.p16),
              AppButton(
                label: 'retry'.tr(),
                onPressed: () => context.read<PointsBloc>().add(
                  const PointsEvent.fetched(),
                ),
              ),
            ],
          );
        }

        final balance = pointsState.balanceOrNull ?? 0;
        return ProfileListRow(
          icon: AppIcons.bottomNavigationCup,
          label: 'points'.tr(),
          trailing: Text(
            balance.toStringAsFixed(0),
            style: Theme.of(context).textTheme.titleLarge,
          ),
        );
      },
    );
  }
}

class _BadgesSection extends StatelessWidget {
  const _BadgesSection();

  Color _badgeColor({
    required int points,
    required int? threshold,
    required ColorScheme scheme,
  }) {
    if (threshold != null && points > threshold) {
      return scheme.primary;
    }
    return scheme.surfaceContainerHighest;
  }

  Future<void> _showBadgeDialog(
    BuildContext context, {
    required String asset,
    required String levelKey,
    required int? threshold,
  }) async {
    await showDialog<void>(
      context: context,
      builder: (dialogContext) {
        final theme = Theme.of(dialogContext);
        final width = MediaQuery.sizeOf(dialogContext).width;
        final formattedThreshold = NumberFormat.decimalPattern(
          dialogContext.locale.toString(),
        ).format(threshold ?? 0);

        // Same full-width layout as [UpdateAppDialog]; primary-only accents.
        return AlertDialog(
          insetPadding: EdgeInsets.zero,
          constraints: BoxConstraints(minWidth: width, maxWidth: width),
          title: SizedBox(
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  levelKey.tr(),
                  style: theme.textTheme.titleLarge,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: AppButton(
                    variant: AppButtonVariant.icon,
                    iconWidget: const SvgIcon(
                      asset: AppIcons.arrowClose,
                    ),
                    onPressed: () => Navigator.of(dialogContext).pop(),
                  ),
                ),
              ],
            ),
          ),
          content: SizedBox(
            width: width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: AppDimensions.p16),

                SvgIcon(
                  asset: asset,
                  size: AppDimensions.iconSizeExtraExtraLarge,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(height: AppDimensions.p16),
                Text(
                  'badge_points_required'.tr(
                    args: [formattedThreshold],
                  ),
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.p24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'badges'.tr(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: AppDimensions.p8),
          BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, profileState) {
              return BlocBuilder<PointsBloc, PointsState>(
                builder: (context, pointsState) {
                  final points = pointsState.balanceOrNull ?? 0;
                  final badges = [
                    (
                      asset: AppIcons.badgeLevelOne,
                      levelKey: 'badge_level_one',
                      threshold: profileState.badgeLevelOneOrNull,
                    ),
                    (
                      asset: AppIcons.badgeLevelTwo,
                      levelKey: 'badge_level_two',
                      threshold: profileState.badgeLevelTwoOrNull,
                    ),
                    (
                      asset: AppIcons.badgeLevelThree,
                      levelKey: 'badge_level_three',
                      threshold: profileState.badgeLevelThreeOrNull,
                    ),
                  ];
                  return Wrap(
                    spacing: AppDimensions.p16,
                    runSpacing: AppDimensions.p8,
                    children: [
                      for (final badge in badges)
                        GestureDetector(
                          onTap: () => _showBadgeDialog(
                            context,
                            asset: badge.asset,
                            levelKey: badge.levelKey,
                            threshold: badge.threshold,
                          ),
                          child: SvgIcon(
                            asset: badge.asset,
                            size: AppDimensions.iconSizeExtraExtraLarge,
                            color: _badgeColor(
                              points: points,
                              threshold: badge.threshold,
                              scheme: scheme,
                            ),
                          ),
                        ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ProfileInfoRow extends StatelessWidget {
  const _ProfileInfoRow({required this.user});

  final UserYogaSalaPlus user;

  @override
  Widget build(BuildContext context) {
    return ProfileListRow(
      icon: AppIcons.profile,
      label: 'profile'.tr(),
      onTap: () async {
        final updated = await context.router.push<bool>(
          ProfileInfoRoute(userYogaSalaPlus: user),
        );
        if (updated == true && context.mounted) {
          context.read<ProfileBloc>().add(const ProfileEvent.fetched());
        }
      },
    );
  }
}

class _PaymentsRow extends StatelessWidget {
  const _PaymentsRow({required this.user});

  final UserYogaSalaPlus user;

  @override
  Widget build(BuildContext context) {
    return ProfileListRow(
      icon: AppIcons.purchases,
      label: 'payments'.tr(),
      onTap: () async {
        await context.router.push(PaywallRoute());
      },
    );
  }
}

class _PrivacyPolicyRow extends StatelessWidget {
  const _PrivacyPolicyRow();

  @override
  Widget build(BuildContext context) {
    return ProfileListRow(
      icon: AppIcons.privacyPolicy,
      label: 'privacy_policy'.tr(),
      onTap: () => context.router.push(const PrivacyPolicyRoute()),
    );
  }
}

class _TermsOfServiceRow extends StatelessWidget {
  const _TermsOfServiceRow();

  @override
  Widget build(BuildContext context) {
    return ProfileListRow(
      icon: AppIcons.termsOfService,
      label: 'terms_of_service'.tr(),
      onTap: () => context.router.push(const TermsOfServiceRoute()),
    );
  }
}

class _RateUsRow extends StatelessWidget {
  const _RateUsRow({required this.user});

  final UserYogaSalaPlus user;

  @override
  Widget build(BuildContext context) {
    return ProfileListRow(
      icon: AppIcons.rateUs,
      label: 'rate_us'.tr(),
      onTap: () async {
        // final updated = await context.router.push<bool>(
        //   ProfileInfoRoute(userYogaSalaPlus: user),
        // );
        // if (updated == true && context.mounted) {
        //   context.read<ProfileBloc>().add(const ProfileEvent.fetched());
        // }
      },
    );
  }
}
