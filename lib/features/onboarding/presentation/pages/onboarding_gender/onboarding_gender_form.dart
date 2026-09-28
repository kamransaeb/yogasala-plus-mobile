import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/constants/app_assets_icons.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/constants/app_spacing.dart';
import 'package:yogasala_plus_mobile/core/navigation/app_router.dart';
import 'package:yogasala_plus_mobile/core/widgets/svg_icon.dart';
import 'package:yogasala_plus_mobile/features/onboarding/presentation/bloc/onboarding_gender/onboarding_gender_bloc.dart';
import 'package:yogasala_plus_mobile/features/onboarding/presentation/widgets/onboarding_header.dart';
import 'package:yogasala_plus_mobile/features/profile/domain/entities/user_yoga_sala_plus.dart';

/// Gender form for onboarding step 3 (progress 3/5).
class OnboardingGenderForm extends StatelessWidget {
  /// Creates a [OnboardingGenderForm].
  const OnboardingGenderForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        OnboardingHeader(
          percent: 3 / 5,
          title: 'gender'.tr(),
        ),
        AppSpacing.verticalSpacing24,
        const Expanded(
          child: Center(
            child: _GenderOptions(),
          ),
        ),
        const _NextButton(),
      ],
    );
  }
}

class _GenderOptions extends StatelessWidget {
  const _GenderOptions();

  @override
  Widget build(BuildContext context) {
    context.locale;
    final gender = context.select<OnboardingGenderBloc, int>(
      (bloc) => bloc.state.gender,
    );
    final theme = Theme.of(context);

    return Column(
      /// Shrink the options column so Center has something to center.
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: _GenderIconTile(
                label: 'female'.tr(),
                asset: AppAssetsIcons.genderFemale,
                selected: gender == 1,
                onTap: () => context.read<OnboardingGenderBloc>().add(
                  const OnboardingGenderEvent.genderChanged(1),
                ),
              ),
            ),
            AppSpacing.horizontalSpacing16,
            Expanded(
              child: _GenderIconTile(
                label: 'male'.tr(),
                asset: AppAssetsIcons.genderMale,
                selected: gender == 0,
                onTap: () => context.read<OnboardingGenderBloc>().add(
                  const OnboardingGenderEvent.genderChanged(0),
                ),
              ),
            ),
          ],
        ),
        AppSpacing.verticalSpacing16,
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(
            gender == 2 ? Icons.radio_button_checked : Icons.radio_button_off,
            color: gender == 2
                ? theme.colorScheme.primary
                : theme.colorScheme.outline,
          ),
          title: Text('gender_not_shared'.tr()),
          onTap: () => context.read<OnboardingGenderBloc>().add(
            const OnboardingGenderEvent.genderChanged(2),
          ),
        ),
      ],
    );
  }
}

class _GenderIconTile extends StatelessWidget {
  const _GenderIconTile({
    required this.label,
    required this.asset,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final String asset;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderColor = selected
        ? theme.colorScheme.primary
        : theme.colorScheme.outline;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppDimensions.textFieldBorderRadius),
      child: Container(
        padding: const EdgeInsets.all(AppDimensions.contentPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            AppDimensions.textFieldBorderRadius,
          ),
          border: Border.all(
            color: borderColor,
            width: AppDimensions.borderLineWidth,
          ),
        ),
        child: Column(
          children: [
            SvgIcon(
              asset: asset,
              size: AppDimensions.iconSizeExtraExtraLarge,
              color: selected
                  ? theme.colorScheme.primary
                  : theme.colorScheme.outline,
            ),
            AppSpacing.verticalSpacing8,
            Text(
              label,
              style: theme.textTheme.titleMedium!.copyWith(
                color: selected
                    ? theme.colorScheme.primary
                    : theme.colorScheme.outline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NextButton extends StatelessWidget {
  const _NextButton();

  @override
  Widget build(BuildContext context) {
    context.locale;
    final gender = context.select<OnboardingGenderBloc, int>(
      (bloc) => bloc.state.gender,
    );
    final user = context.select<OnboardingGenderBloc, UserYogaSalaPlus?>(
      (b) => b.state.user,
    );

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.only(bottom: AppDimensions.pagePadding),
        child: AppButton(
          size: AppButtonSize.large,
          label: 'next'.tr(),
          expanded: true,
          onPressed: gender != -1 && user != null
              ? () {
                  final updated = user.copyWith(gender: gender);
                  unawaited(
                    context.router.push(
                      OnboardingProfilePhotoRoute(userYogaSalaPlus: updated),
                    ),
                  );
                }
              : null,
        ),
      ),
    );
  }
}
