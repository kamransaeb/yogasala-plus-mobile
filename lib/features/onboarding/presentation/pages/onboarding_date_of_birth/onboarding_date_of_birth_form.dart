import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/constants/app_assets_icons.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/navigation/app_router.dart';
import 'package:yogasala_plus_mobile/core/widgets/svg_icon.dart';
import 'package:yogasala_plus_mobile/features/onboarding/presentation/bloc/onboarding_date_of_birth/onboarding_date_of_birth_bloc.dart';
import 'package:yogasala_plus_mobile/features/onboarding/presentation/widgets/onboarding_date_of_birth_cupertino_picker.dart';
import 'package:yogasala_plus_mobile/features/onboarding/presentation/widgets/onboarding_header.dart';
import 'package:yogasala_plus_mobile/features/profile/domain/entities/user_yoga_sala_plus.dart';

/// Birth-date form for onboarding step 2 (progress 2/5).
class OnboardingDateOfBirthForm extends StatelessWidget {
  /// Creates an [OnboardingDateOfBirthForm].
  const OnboardingDateOfBirthForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        OnboardingHeader(
          percent: 2 / 5,
          title: 'date_of_birth'.tr(),
        ),
        const Expanded(
          child: Center(
            child: _DateOfBirthField(),
          ),
        ),
        const _NextButton(),
      ],
    );
  }
}

class _DateOfBirthField extends StatelessWidget {
  const _DateOfBirthField();

  Future<void> _openPicker(BuildContext context) async {
    final bloc = context.read<OnboardingDateOfBirthBloc>();
    final height = MediaQuery.sizeOf(context).height / 3;

    await showModalBottomSheet<void>(
      context: context,
      enableDrag: false,
      isScrollControlled: true,

      builder: (sheetContext) {
        return SafeArea(
          child: AnimatedContainer(
            duration: const Duration(
              milliseconds: AppDimensions.bottomSheetTransitionDuration,
            ),
            height: height,
            margin: EdgeInsets.only(
              bottom: MediaQuery.viewInsetsOf(sheetContext).bottom,
            ),
            padding: const EdgeInsets.all(AppDimensions.pagePadding),
            child: BlocProvider.value(
              value: bloc,
              child: const OnboardingDateOfBirthCupertinoPicker(),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    context.locale;
    final theme = Theme.of(context);
    final dateOfBirth = context.select<OnboardingDateOfBirthBloc, DateTime>(
      (bloc) => bloc.state.dateOfBirth,
    );

    final formatted = DateFormat.yMMMMd(context.locale.toString()).format(
      dateOfBirth,
    );

    return Row(
      children: [
        Expanded(
          child: Text(
            '${'date'.tr()}:',
            style: theme.textTheme.titleMedium,
          ),
        ),
        Expanded(
          flex: 2,
          child: Material(
            color: theme.colorScheme.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                AppDimensions.borderRadius,
              ),
              side: BorderSide(
                color: theme.colorScheme.outline,
                width: AppDimensions.borderLineWidth,
              ),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(
                AppDimensions.borderRadius,
              ),
              onTap: () => unawaited(_openPicker(context)),
              child: SizedBox(
                height: AppDimensions.buttonHeight,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        formatted,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleSmall,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: AppDimensions.contentPadding,
                      ),
                      child: SvgIcon(
                        asset: AppAssetsIcons.arrowDown,
                        size: AppDimensions.iconSizeSmall,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _NextButton extends StatelessWidget {
  const _NextButton();

  @override
  Widget build(BuildContext context) {
    context.locale;
    final user = context.select<OnboardingDateOfBirthBloc, UserYogaSalaPlus?>(
      (b) => b.state.user,
    );
    final dateOfBirth = context.select<OnboardingDateOfBirthBloc, DateTime>(
      (bloc) => bloc.state.dateOfBirth,
    );

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.only(bottom: AppDimensions.pagePadding),
        child: AppButton(
          size: AppButtonSize.large,
          label: 'next'.tr(),
          expanded: true,
          onPressed: user == null
              ? null
              : () {
                  final updated = user.copyWith(dateOfBirth: dateOfBirth);
                  unawaited(
                    context.router.push(
                      OnboardingGenderRoute(userYogaSalaPlus: updated),
                    ),
                  );
                },
        ),
      ),
    );
  }
}
