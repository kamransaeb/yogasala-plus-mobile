import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/widgets/buttons/locale_buttons.dart';
import 'package:yogasala_plus_mobile/core/widgets/buttons/theme_toggle_button.dart';
import 'package:yogasala_plus_mobile/di/injection.dart';
import 'package:yogasala_plus_mobile/features/onboarding/presentation/bloc/onboarding_date_of_birth/onboarding_date_of_birth_bloc.dart';
import 'package:yogasala_plus_mobile/features/onboarding/presentation/pages/onboarding_date_of_birth/onboarding_date_of_birth_form.dart';
import 'package:yogasala_plus_mobile/features/profile/domain/entities/user_yoga_sala_plus.dart';

/// Onboarding step 2 — collect date of birth.
@RoutePage()
class OnboardingDateOfBirthPage extends StatelessWidget {
  /// Creates a [OnboardingDateOfBirthPage].
  const OnboardingDateOfBirthPage({required this.userYogaSalaPlus, super.key});

  /// Profile being completed.
  final UserYogaSalaPlus userYogaSalaPlus;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<OnboardingDateOfBirthBloc>()
            ..add(OnboardingDateOfBirthEvent.fetched(userYogaSalaPlus)),
      child: Scaffold(
        appBar: AppBar(
          actions: const [LocaleButtons(), ThemeToggleButton()],
        ),
        body: const Padding(
          padding: EdgeInsets.fromLTRB(
            AppDimensions.pagePadding,
            AppDimensions.pagePadding,
            AppDimensions.pagePadding,
            0,
          ),
          child: OnboardingDateOfBirthForm(),
        ),
      ),
    );
  }
}
