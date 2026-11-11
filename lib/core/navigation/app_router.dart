import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/core/navigation/route_guards.dart';
import 'package:yogasala_plus_mobile/features/app_director/presentation/pages/app_director_page.dart';
import 'package:yogasala_plus_mobile/features/calendar/presentation/pages/calendar_page.dart';
import 'package:yogasala_plus_mobile/features/home/presentation/pages/home_page.dart';
import 'package:yogasala_plus_mobile/features/leaderboard/presentation/pages/leaderboard_page.dart';
import 'package:yogasala_plus_mobile/features/live_videos/presentation/pages/live_videos_page.dart';
import 'package:yogasala_plus_mobile/features/login/presentation/pages/login_page.dart';
import 'package:yogasala_plus_mobile/features/main/presentation/pages/main_shell_page.dart';
import 'package:yogasala_plus_mobile/features/onboarding/presentation/pages/onboarding_agreements/onboarding_agreements_page.dart';
import 'package:yogasala_plus_mobile/features/onboarding/presentation/pages/onboarding_date_of_birth/onboarding_date_of_birth_page.dart';
import 'package:yogasala_plus_mobile/features/onboarding/presentation/pages/onboarding_gender/onboarding_gender_page.dart';
import 'package:yogasala_plus_mobile/features/onboarding/presentation/pages/onboarding_name_surname/onboarding_name_surname_page.dart';
import 'package:yogasala_plus_mobile/features/onboarding/presentation/pages/onboarding_profile_photo/onboarding_profile_photo_page.dart';
import 'package:yogasala_plus_mobile/features/profile/domain/entities/user_yoga_sala_plus.dart';
import 'package:yogasala_plus_mobile/features/profile/presentation/pages/privacy_policy/privacy_policy_page.dart';
import 'package:yogasala_plus_mobile/features/profile/presentation/pages/profile_info/profile_info_page.dart';
import 'package:yogasala_plus_mobile/features/profile/presentation/pages/profile_page.dart';
import 'package:yogasala_plus_mobile/features/profile/presentation/pages/terms_of_service/terms_of_service_page.dart';
import 'package:yogasala_plus_mobile/features/quiz/presentation/pages/quiz_attempt_detail_page.dart';
import 'package:yogasala_plus_mobile/features/quiz/presentation/pages/quiz_attempts_page.dart';
import 'package:yogasala_plus_mobile/features/quiz/presentation/pages/quiz_page.dart';
import 'package:yogasala_plus_mobile/features/reset_password/presentation/pages/reset_password_page.dart';
import 'package:yogasala_plus_mobile/features/series/presentation/pages/serie_page.dart';
import 'package:yogasala_plus_mobile/features/sign_up/presentation/pages/sign_up_page.dart';
import 'package:yogasala_plus_mobile/features/subscriptions/presentation/pages/paywall_page.dart';
import 'package:yogasala_plus_mobile/features/teachers/presentation/pages/teacher_page.dart';
import 'package:yogasala_plus_mobile/features/video_player/presentation/pages/video_player_page.dart';
import 'package:yogasala_plus_mobile/features/videos/presentation/pages/video_page.dart';

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
    // Authenticated tab shell.
    AutoRoute(
      page: MainShellRoute.page,
      path: '/main',
      guards: const [AuthGuard()],
      children: [
        AutoRoute(
          page: HomeRoute.page,
          path: 'home',
          initial: true,
          maintainState: false,
        ),
        AutoRoute(
          page: LiveVideosRoute.page,
          path: 'live-videos',
          // Recreate tab on visit so StatelessWidget pages refetch.
          maintainState: false,
        ),
        AutoRoute(
          page: CalendarRoute.page,
          path: 'calendar',
          maintainState: false,
        ),
        AutoRoute(
          page: LeaderboardRoute.page,
          path: 'leaderboard',
          maintainState: false,
        ),
        AutoRoute(
          page: ProfileRoute.page,
          path: 'profile',
          maintainState: false,
        ),
      ],
    ),
    AutoRoute(
      page: SerieRoute.page,
      path: '/serie/:serieId',
      guards: const [AuthGuard()],
    ),
    AutoRoute(
      page: TeacherRoute.page,
      path: '/teacher/:teacherId',
      guards: const [AuthGuard()],
    ),
    AutoRoute(
      page: VideoRoute.page,
      path: '/serie/:serieId/video/:videoId',
      guards: const [AuthGuard()],
    ),
    AutoRoute(
      page: QuizRoute.page,
      path: '/video/:videoId/quiz',
      guards: const [AuthGuard()],
    ),
    AutoRoute(
      page: QuizAttemptsRoute.page,
      path: '/quiz-attempts',
      guards: const [AuthGuard()],
    ),
    AutoRoute(
      page: QuizAttemptDetailRoute.page,
      path: '/quiz-attempts/:attemptId',
      guards: const [AuthGuard()],
    ),
    AutoRoute(
      page: VideoPlayerRoute.page,
      path: '/video-player',
      guards: const [AuthGuard()],
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
    AutoRoute(
      page: ProfileInfoRoute.page,
      path: '/profile/info',
      guards: const [AuthGuard()],
    ),
    AutoRoute(
      page: PrivacyPolicyRoute.page,
      path: '/profile/privacy-policy',
      guards: const [AuthGuard()],
    ),
    AutoRoute(
      page: TermsOfServiceRoute.page,
      path: '/profile/terms-of-service',
      guards: const [AuthGuard()],
    ),
    AutoRoute(
      page: PaywallRoute.page,
      path: '/paywall',
      guards: const [AuthGuard()],
    ),
  ];
}
