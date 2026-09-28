import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/di/injection.dart';
import 'package:yogasala_plus_mobile/features/onboarding/presentation/bloc/onboarding_name_surname/onboarding_name_surname_bloc.dart';
import 'package:yogasala_plus_mobile/features/onboarding/presentation/pages/onboarding_name_surname/onboarding_name_surname_form.dart';
import 'package:yogasala_plus_mobile/features/profile/domain/entities/user_yoga_sala_plus.dart';

/// Onboarding step 1 — collect name and surname.
@RoutePage()
class OnboardingNameSurnamePage extends StatelessWidget {
  /// Creates a [OnboardingNameSurnamePage].
  const OnboardingNameSurnamePage({required this.userYogaSalaPlus, super.key});

  /// Profile being completed.
  final UserYogaSalaPlus userYogaSalaPlus;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<OnboardingNameSurnameBloc>()
            ..add(OnboardingNameSurnameEvent.fetched(userYogaSalaPlus)),
      child: PopScope(
        canPop: false, // blocks Android back (and iOS pop if applicable)
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
        },
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false, // hide AppBar back too
          ),
          body: const Padding(
            padding: EdgeInsets.fromLTRB(
              AppDimensions.pagePadding,
              AppDimensions.pagePadding,
              AppDimensions.pagePadding,
              0,
            ),
            child: OnboardingNameSurnameForm(),
          ),
        ),
      ),
    );
  }
}
