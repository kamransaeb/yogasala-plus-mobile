import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/widgets/buttons/theme_toggle_button.dart';
import 'package:yogasala_plus_mobile/di/injection.dart';
import 'package:yogasala_plus_mobile/features/onboarding/presentation/bloc/onboarding_profile_photo/onboarding_profile_photo_bloc.dart';
import 'package:yogasala_plus_mobile/features/onboarding/presentation/pages/onboarding_profile_photo/onboarding_profile_photo_form.dart';
import 'package:yogasala_plus_mobile/features/profile/domain/entities/user_yoga_sala_plus.dart';

/// Onboarding step 4 — optional profile photo.
@RoutePage()
class OnboardingProfilePhotoPage extends StatelessWidget {
  /// Creates a [OnboardingProfilePhotoPage].
  const OnboardingProfilePhotoPage({required this.userYogaSalaPlus, super.key});

  /// Profile being completed.
  final UserYogaSalaPlus userYogaSalaPlus;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<OnboardingProfilePhotoBloc>()
            ..add(OnboardingProfilePhotoEvent.fetched(userYogaSalaPlus)),
      child: Scaffold(
        appBar: AppBar(),
        body: const Padding(
          padding: EdgeInsets.fromLTRB(
            AppDimensions.pagePadding,
            AppDimensions.pagePadding,
            AppDimensions.pagePadding,
            0,
          ),
          child: OnboardingProfilePhotoForm(),
        ),
      ),
    );
  }
}
