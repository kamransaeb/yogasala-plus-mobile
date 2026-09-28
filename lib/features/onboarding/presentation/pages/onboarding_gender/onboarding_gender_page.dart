import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/di/injection.dart';
import 'package:yogasala_plus_mobile/features/onboarding/presentation/bloc/onboarding_gender/onboarding_gender_bloc.dart';
import 'package:yogasala_plus_mobile/features/onboarding/presentation/pages/onboarding_gender/onboarding_gender_form.dart';
import 'package:yogasala_plus_mobile/features/profile/domain/entities/user_yoga_sala_plus.dart';

/// Onboarding step 3 — collect gender.
@RoutePage()
class OnboardingGenderPage extends StatelessWidget {
  /// Creates a [OnboardingGenderPage].
  const OnboardingGenderPage({required this.userYogaSalaPlus, super.key});

  /// Profile being completed.
  final UserYogaSalaPlus userYogaSalaPlus;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<OnboardingGenderBloc>()
            ..add(OnboardingGenderEvent.fetched(userYogaSalaPlus)),
      child: Scaffold(
        appBar: AppBar(),
        body: const Padding(
          padding: EdgeInsets.fromLTRB(
            AppDimensions.pagePadding,
            AppDimensions.pagePadding,
            AppDimensions.pagePadding,
            0,
          ),
          child: OnboardingGenderForm(),
        ),
      ),
    );
  }
}
