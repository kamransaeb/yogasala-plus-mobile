import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/core/navigation/route_guards.dart';
import 'package:yogasala_plus_mobile/features/app_director/presentation/pages/app_director_page.dart';
import 'package:yogasala_plus_mobile/features/home/presentation/pages/home_page.dart';
import 'package:yogasala_plus_mobile/features/login/presentation/pages/login_page.dart';
import 'package:yogasala_plus_mobile/features/main/presentation/pages/main_shell_page.dart';
import 'package:yogasala_plus_mobile/features/onboarding/presentation/pages/onboarding_agreements/onboarding_agreements_page.dart';
import 'package:yogasala_plus_mobile/features/onboarding/presentation/pages/onboarding_date_of_birth/onboarding_date_of_birth_page.dart';
import 'package:yogasala_plus_mobile/features/onboarding/presentation/pages/onboarding_gender/onboarding_gender_page.dart';
import 'package:yogasala_plus_mobile/features/onboarding/presentation/pages/onboarding_name_surname/onboarding_name_surname_page.dart';
import 'package:yogasala_plus_mobile/features/onboarding/presentation/pages/onboarding_profile_photo/onboarding_profile_photo_page.dart';
import 'package:yogasala_plus_mobile/features/posts/presentation/pages/posts_demo_page.dart';
import 'package:yogasala_plus_mobile/features/profile/domain/entities/user_yoga_sala_plus.dart';
import 'package:yogasala_plus_mobile/features/profile/presentation/pages/profile_page.dart';
import 'package:yogasala_plus_mobile/features/reset_password/presentation/pages/reset_password_page.dart';
import 'package:yogasala_plus_mobile/features/sign_up/presentation/pages/sign_up_page.dart';

part 'app_router.gr.dart';

/// [AppRouter] is the main router for the app.
@singleton
@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    // Unguarded bootstrap: AppData + auth decision live on this page.
    AutoRoute(
      page: AppDirectorRoute.page,
      path: '/',
      initial: true,
    ),
    AutoRoute(
      page: LoginRoute.page,
      path: '/login',
      guards: const [AuthGuard(requiresAuth: false)],
    ),
    AutoRoute(
      page: SignUpRoute.page,
      path: '/sign-up',
      guards: const [AuthGuard(requiresAuth: false)],
    ),
    AutoRoute(
      page: ResetPasswordRoute.page,
      path: '/reset-password',
      guards: const [AuthGuard(requiresAuth: false)],
    ),
    // Authenticated tab shell (Videos + Profile). Onboarding stays outside.
    AutoRoute(
      page: MainShellRoute.page,
      path: '/main',
      guards: const [AuthGuard()],
      children: [
        AutoRoute(
          page: HomeRoute.page,
          path: 'home',
          initial: true,
        ),
        AutoRoute(
          page: ProfileRoute.page,
          path: 'profile',
        ),
      ],
    ),
    AutoRoute(
      page: OnboardingNameSurnameRoute.page,
      path: '/onboarding/name-surname',
      guards: const [AuthGuard()],
    ),
    AutoRoute(
      page: OnboardingDateOfBirthRoute.page,
      path: '/onboarding/date-of-birth',
      guards: const [AuthGuard()],
    ),
    AutoRoute(
      page: OnboardingGenderRoute.page,
      path: '/onboarding/gender',
      guards: const [AuthGuard()],
    ),
    AutoRoute(
      page: OnboardingProfilePhotoRoute.page,
      path: '/onboarding/profile-photo',
      guards: const [AuthGuard()],
    ),
    AutoRoute(
      page: OnboardingAgreementsRoute.page,
      path: '/onboarding/agreements',
      guards: const [AuthGuard()],
    ),
  ];
}
