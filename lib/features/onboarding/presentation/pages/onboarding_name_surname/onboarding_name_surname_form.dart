import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/constants/app_spacing.dart';
import 'package:yogasala_plus_mobile/core/navigation/app_router.dart';
import 'package:yogasala_plus_mobile/features/onboarding/presentation/bloc/onboarding_name_surname/onboarding_name_surname_bloc.dart';
import 'package:yogasala_plus_mobile/features/onboarding/presentation/widgets/onboarding_header.dart';
import 'package:yogasala_plus_mobile/features/profile/domain/entities/user_yoga_sala_plus.dart';

/// Name / surname form for onboarding step 1 (progress 1/5).
class OnboardingNameSurnameForm extends StatelessWidget {
  /// Creates an [OnboardingNameSurnameForm].
  const OnboardingNameSurnameForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OnboardingHeader(
          percent: 1 / 5,
          title: 'name_and_surname'.tr(),
        ),
        const Expanded(child: _ScrollableFields()),
        const _NextButton(),
      ],
    );
  }
}

/// Centers the fields when there is room; scrolls when the keyboard shrinks
/// the available height.
class _ScrollableFields extends StatelessWidget {
  const _ScrollableFields();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: AppDimensions.contentPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _NameInput(),
              AppSpacing.verticalSpacing16,
              _SurnameInput(),
            ],
          ),
        ),
      ),
    );
  }
}

class _NameInput extends StatelessWidget {
  const _NameInput();

  @override
  Widget build(BuildContext context) {
    context.locale;
    final displayError = context
        .select<OnboardingNameSurnameBloc, NameValidationError?>(
          (bloc) => bloc.state.nameInput.displayError,
        );

    return TextFormField(
      initialValue: context
          .read<OnboardingNameSurnameBloc>()
          .state
          .nameInput
          .value,
      textInputAction: TextInputAction.next,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        labelText: 'name'.tr(),
        errorText: displayError != null ? 'wrong_name'.tr() : null,
      ),
      onChanged: (value) => context.read<OnboardingNameSurnameBloc>().add(
        OnboardingNameSurnameEvent.nameChanged(value),
      ),
    );
  }
}

class _SurnameInput extends StatelessWidget {
  const _SurnameInput();

  @override
  Widget build(BuildContext context) {
    context.locale;
    final displayError = context
        .select<OnboardingNameSurnameBloc, NameValidationError?>(
          (bloc) => bloc.state.surnameInput.displayError,
        );

    return TextFormField(
      initialValue: context
          .read<OnboardingNameSurnameBloc>()
          .state
          .surnameInput
          .value,
      textInputAction: TextInputAction.done,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        labelText: 'surname'.tr(),
        errorText: displayError != null ? 'wrong_surname'.tr() : null,
      ),
      onChanged: (value) => context.read<OnboardingNameSurnameBloc>().add(
        OnboardingNameSurnameEvent.surnameChanged(value),
      ),
    );
  }
}

class _NextButton extends StatelessWidget {
  const _NextButton();

  @override
  Widget build(BuildContext context) {
    context.locale;
    final isValid = context.select<OnboardingNameSurnameBloc, bool>(
      (bloc) => bloc.state.isValid,
    );
    final user = context.select<OnboardingNameSurnameBloc, UserYogaSalaPlus?>(
      (b) => b.state.user,
    );

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.only(
          top: AppDimensions.contentPadding,
          bottom: AppDimensions.pagePadding,
        ),
        child: AppButton(
          size: AppButtonSize.large,
          label: 'next'.tr(),
          expanded: true,
          onPressed: isValid && user != null
              ? () {
                  final state = context.read<OnboardingNameSurnameBloc>().state;
                  final updated = user.copyWith(
                    name: state.nameInput.value.trim(),
                    surname: state.surnameInput.value.trim(),
                  );
                  unawaited(
                    context.router.push(
                      OnboardingDateOfBirthRoute(userYogaSalaPlus: updated),
                    ),
                  );
                }
              : null,
        ),
      ),
    );
  }
}
