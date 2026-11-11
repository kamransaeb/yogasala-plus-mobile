// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AppDirectorPage]
class AppDirectorRoute extends PageRouteInfo<void> {
  const AppDirectorRoute({List<PageRouteInfo>? children})
    : super(AppDirectorRoute.name, initialChildren: children);

  static const String name = 'AppDirectorRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AppDirectorPage();
    },
  );
}

/// generated route for
/// [CalendarPage]
class CalendarRoute extends PageRouteInfo<void> {
  const CalendarRoute({List<PageRouteInfo>? children})
    : super(CalendarRoute.name, initialChildren: children);

  static const String name = 'CalendarRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CalendarPage();
    },
  );
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomePage();
    },
  );
}

/// generated route for
/// [LeaderboardPage]
class LeaderboardRoute extends PageRouteInfo<void> {
  const LeaderboardRoute({List<PageRouteInfo>? children})
    : super(LeaderboardRoute.name, initialChildren: children);

  static const String name = 'LeaderboardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LeaderboardPage();
    },
  );
}

/// generated route for
/// [LiveVideosPage]
class LiveVideosRoute extends PageRouteInfo<void> {
  const LiveVideosRoute({List<PageRouteInfo>? children})
    : super(LiveVideosRoute.name, initialChildren: children);

  static const String name = 'LiveVideosRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LiveVideosPage();
    },
  );
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    Key? key,
    void Function({bool? success})? onResult,
    String? email,
    String? password,
    List<PageRouteInfo>? children,
  }) : super(
         LoginRoute.name,
         args: LoginRouteArgs(
           key: key,
           onResult: onResult,
           email: email,
           password: password,
         ),
         initialChildren: children,
       );

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginRouteArgs>(
        orElse: () => const LoginRouteArgs(),
      );
      return LoginPage(
        key: args.key,
        onResult: args.onResult,
        email: args.email,
        password: args.password,
      );
    },
  );
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key, this.onResult, this.email, this.password});

  final Key? key;

  final void Function({bool? success})? onResult;

  final String? email;

  final String? password;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, onResult: $onResult, email: $email, password: $password}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LoginRouteArgs) return false;
    return key == other.key &&
        email == other.email &&
        password == other.password;
  }

  @override
  int get hashCode => key.hashCode ^ email.hashCode ^ password.hashCode;
}

/// generated route for
/// [MainShellPage]
class MainShellRoute extends PageRouteInfo<void> {
  const MainShellRoute({List<PageRouteInfo>? children})
    : super(MainShellRoute.name, initialChildren: children);

  static const String name = 'MainShellRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainShellPage();
    },
  );
}

/// generated route for
/// [OnboardingAgreementsPage]
class OnboardingAgreementsRoute
    extends PageRouteInfo<OnboardingAgreementsRouteArgs> {
  OnboardingAgreementsRoute({
    required UserYogaSalaPlus userYogaSalaPlus,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         OnboardingAgreementsRoute.name,
         args: OnboardingAgreementsRouteArgs(
           userYogaSalaPlus: userYogaSalaPlus,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'OnboardingAgreementsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OnboardingAgreementsRouteArgs>();
      return OnboardingAgreementsPage(
        userYogaSalaPlus: args.userYogaSalaPlus,
        key: args.key,
      );
    },
  );
}

class OnboardingAgreementsRouteArgs {
  const OnboardingAgreementsRouteArgs({
    required this.userYogaSalaPlus,
    this.key,
  });

  final UserYogaSalaPlus userYogaSalaPlus;

  final Key? key;

  @override
  String toString() {
    return 'OnboardingAgreementsRouteArgs{userYogaSalaPlus: $userYogaSalaPlus, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OnboardingAgreementsRouteArgs) return false;
    return userYogaSalaPlus == other.userYogaSalaPlus && key == other.key;
  }

  @override
  int get hashCode => userYogaSalaPlus.hashCode ^ key.hashCode;
}

/// generated route for
/// [OnboardingDateOfBirthPage]
class OnboardingDateOfBirthRoute
    extends PageRouteInfo<OnboardingDateOfBirthRouteArgs> {
  OnboardingDateOfBirthRoute({
    required UserYogaSalaPlus userYogaSalaPlus,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         OnboardingDateOfBirthRoute.name,
         args: OnboardingDateOfBirthRouteArgs(
           userYogaSalaPlus: userYogaSalaPlus,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'OnboardingDateOfBirthRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OnboardingDateOfBirthRouteArgs>();
      return OnboardingDateOfBirthPage(
        userYogaSalaPlus: args.userYogaSalaPlus,
        key: args.key,
      );
    },
  );
}

class OnboardingDateOfBirthRouteArgs {
  const OnboardingDateOfBirthRouteArgs({
    required this.userYogaSalaPlus,
    this.key,
  });

  final UserYogaSalaPlus userYogaSalaPlus;

  final Key? key;

  @override
  String toString() {
    return 'OnboardingDateOfBirthRouteArgs{userYogaSalaPlus: $userYogaSalaPlus, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OnboardingDateOfBirthRouteArgs) return false;
    return userYogaSalaPlus == other.userYogaSalaPlus && key == other.key;
  }

  @override
  int get hashCode => userYogaSalaPlus.hashCode ^ key.hashCode;
}

/// generated route for
/// [OnboardingGenderPage]
class OnboardingGenderRoute extends PageRouteInfo<OnboardingGenderRouteArgs> {
  OnboardingGenderRoute({
    required UserYogaSalaPlus userYogaSalaPlus,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         OnboardingGenderRoute.name,
         args: OnboardingGenderRouteArgs(
           userYogaSalaPlus: userYogaSalaPlus,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'OnboardingGenderRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OnboardingGenderRouteArgs>();
      return OnboardingGenderPage(
        userYogaSalaPlus: args.userYogaSalaPlus,
        key: args.key,
      );
    },
  );
}

class OnboardingGenderRouteArgs {
  const OnboardingGenderRouteArgs({required this.userYogaSalaPlus, this.key});

  final UserYogaSalaPlus userYogaSalaPlus;

  final Key? key;

  @override
  String toString() {
    return 'OnboardingGenderRouteArgs{userYogaSalaPlus: $userYogaSalaPlus, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OnboardingGenderRouteArgs) return false;
    return userYogaSalaPlus == other.userYogaSalaPlus && key == other.key;
  }

  @override
  int get hashCode => userYogaSalaPlus.hashCode ^ key.hashCode;
}

/// generated route for
/// [OnboardingNameSurnamePage]
class OnboardingNameSurnameRoute
    extends PageRouteInfo<OnboardingNameSurnameRouteArgs> {
  OnboardingNameSurnameRoute({
    required UserYogaSalaPlus userYogaSalaPlus,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         OnboardingNameSurnameRoute.name,
         args: OnboardingNameSurnameRouteArgs(
           userYogaSalaPlus: userYogaSalaPlus,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'OnboardingNameSurnameRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OnboardingNameSurnameRouteArgs>();
      return OnboardingNameSurnamePage(
        userYogaSalaPlus: args.userYogaSalaPlus,
        key: args.key,
      );
    },
  );
}

class OnboardingNameSurnameRouteArgs {
  const OnboardingNameSurnameRouteArgs({
    required this.userYogaSalaPlus,
    this.key,
  });

  final UserYogaSalaPlus userYogaSalaPlus;

  final Key? key;

  @override
  String toString() {
    return 'OnboardingNameSurnameRouteArgs{userYogaSalaPlus: $userYogaSalaPlus, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OnboardingNameSurnameRouteArgs) return false;
    return userYogaSalaPlus == other.userYogaSalaPlus && key == other.key;
  }

  @override
  int get hashCode => userYogaSalaPlus.hashCode ^ key.hashCode;
}

/// generated route for
/// [OnboardingProfilePhotoPage]
class OnboardingProfilePhotoRoute
    extends PageRouteInfo<OnboardingProfilePhotoRouteArgs> {
  OnboardingProfilePhotoRoute({
    required UserYogaSalaPlus userYogaSalaPlus,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         OnboardingProfilePhotoRoute.name,
         args: OnboardingProfilePhotoRouteArgs(
           userYogaSalaPlus: userYogaSalaPlus,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'OnboardingProfilePhotoRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OnboardingProfilePhotoRouteArgs>();
      return OnboardingProfilePhotoPage(
        userYogaSalaPlus: args.userYogaSalaPlus,
        key: args.key,
      );
    },
  );
}

class OnboardingProfilePhotoRouteArgs {
  const OnboardingProfilePhotoRouteArgs({
    required this.userYogaSalaPlus,
    this.key,
  });

  final UserYogaSalaPlus userYogaSalaPlus;

  final Key? key;

  @override
  String toString() {
    return 'OnboardingProfilePhotoRouteArgs{userYogaSalaPlus: $userYogaSalaPlus, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OnboardingProfilePhotoRouteArgs) return false;
    return userYogaSalaPlus == other.userYogaSalaPlus && key == other.key;
  }

  @override
  int get hashCode => userYogaSalaPlus.hashCode ^ key.hashCode;
}

/// generated route for
/// [PaywallPage]
class PaywallRoute extends PageRouteInfo<PaywallRouteArgs> {
  PaywallRoute({Key? key, String? highlightPlan, List<PageRouteInfo>? children})
    : super(
        PaywallRoute.name,
        args: PaywallRouteArgs(key: key, highlightPlan: highlightPlan),
        rawQueryParams: {'highlightPlan': highlightPlan},
        initialChildren: children,
      );

  static const String name = 'PaywallRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final queryParams = data.queryParams;
      final args = data.argsAs<PaywallRouteArgs>(
        orElse: () => PaywallRouteArgs(
          highlightPlan: queryParams.optString('highlightPlan'),
        ),
      );
      return PaywallPage(key: args.key, highlightPlan: args.highlightPlan);
    },
  );
}

class PaywallRouteArgs {
  const PaywallRouteArgs({this.key, this.highlightPlan});

  final Key? key;

  final String? highlightPlan;

  @override
  String toString() {
    return 'PaywallRouteArgs{key: $key, highlightPlan: $highlightPlan}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PaywallRouteArgs) return false;
    return key == other.key && highlightPlan == other.highlightPlan;
  }

  @override
  int get hashCode => key.hashCode ^ highlightPlan.hashCode;
}

/// generated route for
/// [PrivacyPolicyPage]
class PrivacyPolicyRoute extends PageRouteInfo<void> {
  const PrivacyPolicyRoute({List<PageRouteInfo>? children})
    : super(PrivacyPolicyRoute.name, initialChildren: children);

  static const String name = 'PrivacyPolicyRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PrivacyPolicyPage();
    },
  );
}

/// generated route for
/// [ProfileInfoPage]
class ProfileInfoRoute extends PageRouteInfo<ProfileInfoRouteArgs> {
  ProfileInfoRoute({
    required UserYogaSalaPlus userYogaSalaPlus,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         ProfileInfoRoute.name,
         args: ProfileInfoRouteArgs(
           userYogaSalaPlus: userYogaSalaPlus,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'ProfileInfoRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProfileInfoRouteArgs>();
      return ProfileInfoPage(
        userYogaSalaPlus: args.userYogaSalaPlus,
        key: args.key,
      );
    },
  );
}

class ProfileInfoRouteArgs {
  const ProfileInfoRouteArgs({required this.userYogaSalaPlus, this.key});

  final UserYogaSalaPlus userYogaSalaPlus;

  final Key? key;

  @override
  String toString() {
    return 'ProfileInfoRouteArgs{userYogaSalaPlus: $userYogaSalaPlus, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProfileInfoRouteArgs) return false;
    return userYogaSalaPlus == other.userYogaSalaPlus && key == other.key;
  }

  @override
  int get hashCode => userYogaSalaPlus.hashCode ^ key.hashCode;
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfilePage();
    },
  );
}

/// generated route for
/// [QuizAttemptDetailPage]
class QuizAttemptDetailRoute extends PageRouteInfo<QuizAttemptDetailRouteArgs> {
  QuizAttemptDetailRoute({
    required int attemptId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         QuizAttemptDetailRoute.name,
         args: QuizAttemptDetailRouteArgs(attemptId: attemptId, key: key),
         rawPathParams: {'attemptId': attemptId},
         initialChildren: children,
       );

  static const String name = 'QuizAttemptDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<QuizAttemptDetailRouteArgs>(
        orElse: () => QuizAttemptDetailRouteArgs(
          attemptId: pathParams.getInt('attemptId'),
        ),
      );
      return QuizAttemptDetailPage(attemptId: args.attemptId, key: args.key);
    },
  );
}

class QuizAttemptDetailRouteArgs {
  const QuizAttemptDetailRouteArgs({required this.attemptId, this.key});

  final int attemptId;

  final Key? key;

  @override
  String toString() {
    return 'QuizAttemptDetailRouteArgs{attemptId: $attemptId, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! QuizAttemptDetailRouteArgs) return false;
    return attemptId == other.attemptId && key == other.key;
  }

  @override
  int get hashCode => attemptId.hashCode ^ key.hashCode;
}

/// generated route for
/// [QuizAttemptsPage]
class QuizAttemptsRoute extends PageRouteInfo<void> {
  const QuizAttemptsRoute({List<PageRouteInfo>? children})
    : super(QuizAttemptsRoute.name, initialChildren: children);

  static const String name = 'QuizAttemptsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const QuizAttemptsPage();
    },
  );
}

/// generated route for
/// [QuizPage]
class QuizRoute extends PageRouteInfo<QuizRouteArgs> {
  QuizRoute({required int videoId, Key? key, List<PageRouteInfo>? children})
    : super(
        QuizRoute.name,
        args: QuizRouteArgs(videoId: videoId, key: key),
        rawPathParams: {'videoId': videoId},
        initialChildren: children,
      );

  static const String name = 'QuizRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<QuizRouteArgs>(
        orElse: () => QuizRouteArgs(videoId: pathParams.getInt('videoId')),
      );
      return QuizPage(videoId: args.videoId, key: args.key);
    },
  );
}

class QuizRouteArgs {
  const QuizRouteArgs({required this.videoId, this.key});

  final int videoId;

  final Key? key;

  @override
  String toString() {
    return 'QuizRouteArgs{videoId: $videoId, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! QuizRouteArgs) return false;
    return videoId == other.videoId && key == other.key;
  }

  @override
  int get hashCode => videoId.hashCode ^ key.hashCode;
}

/// generated route for
/// [ResetPasswordPage]
class ResetPasswordRoute extends PageRouteInfo<void> {
  const ResetPasswordRoute({List<PageRouteInfo>? children})
    : super(ResetPasswordRoute.name, initialChildren: children);

  static const String name = 'ResetPasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ResetPasswordPage();
    },
  );
}

/// generated route for
/// [SeriePage]
class SerieRoute extends PageRouteInfo<SerieRouteArgs> {
  SerieRoute({required int serieId, Key? key, List<PageRouteInfo>? children})
    : super(
        SerieRoute.name,
        args: SerieRouteArgs(serieId: serieId, key: key),
        rawPathParams: {'serieId': serieId},
        initialChildren: children,
      );

  static const String name = 'SerieRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<SerieRouteArgs>(
        orElse: () => SerieRouteArgs(serieId: pathParams.getInt('serieId')),
      );
      return SeriePage(serieId: args.serieId, key: args.key);
    },
  );
}

class SerieRouteArgs {
  const SerieRouteArgs({required this.serieId, this.key});

  final int serieId;

  final Key? key;

  @override
  String toString() {
    return 'SerieRouteArgs{serieId: $serieId, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SerieRouteArgs) return false;
    return serieId == other.serieId && key == other.key;
  }

  @override
  int get hashCode => serieId.hashCode ^ key.hashCode;
}

/// generated route for
/// [SignUpPage]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute({List<PageRouteInfo>? children})
    : super(SignUpRoute.name, initialChildren: children);

  static const String name = 'SignUpRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SignUpPage();
    },
  );
}

/// generated route for
/// [TeacherPage]
class TeacherRoute extends PageRouteInfo<TeacherRouteArgs> {
  TeacherRoute({
    required int teacherId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         TeacherRoute.name,
         args: TeacherRouteArgs(teacherId: teacherId, key: key),
         rawPathParams: {'teacherId': teacherId},
         initialChildren: children,
       );

  static const String name = 'TeacherRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<TeacherRouteArgs>(
        orElse: () =>
            TeacherRouteArgs(teacherId: pathParams.getInt('teacherId')),
      );
      return TeacherPage(teacherId: args.teacherId, key: args.key);
    },
  );
}

class TeacherRouteArgs {
  const TeacherRouteArgs({required this.teacherId, this.key});

  final int teacherId;

  final Key? key;

  @override
  String toString() {
    return 'TeacherRouteArgs{teacherId: $teacherId, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TeacherRouteArgs) return false;
    return teacherId == other.teacherId && key == other.key;
  }

  @override
  int get hashCode => teacherId.hashCode ^ key.hashCode;
}

/// generated route for
/// [TermsOfServicePage]
class TermsOfServiceRoute extends PageRouteInfo<void> {
  const TermsOfServiceRoute({List<PageRouteInfo>? children})
    : super(TermsOfServiceRoute.name, initialChildren: children);

  static const String name = 'TermsOfServiceRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TermsOfServicePage();
    },
  );
}

/// generated route for
/// [VideoPage]
class VideoRoute extends PageRouteInfo<VideoRouteArgs> {
  VideoRoute({
    required int videoId,
    required int serieId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         VideoRoute.name,
         args: VideoRouteArgs(videoId: videoId, serieId: serieId, key: key),
         rawPathParams: {'videoId': videoId, 'serieId': serieId},
         initialChildren: children,
       );

  static const String name = 'VideoRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<VideoRouteArgs>(
        orElse: () => VideoRouteArgs(
          videoId: pathParams.getInt('videoId'),
          serieId: pathParams.getInt('serieId'),
        ),
      );
      return VideoPage(
        videoId: args.videoId,
        serieId: args.serieId,
        key: args.key,
      );
    },
  );
}

class VideoRouteArgs {
  const VideoRouteArgs({
    required this.videoId,
    required this.serieId,
    this.key,
  });

  final int videoId;

  final int serieId;

  final Key? key;

  @override
  String toString() {
    return 'VideoRouteArgs{videoId: $videoId, serieId: $serieId, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! VideoRouteArgs) return false;
    return videoId == other.videoId &&
        serieId == other.serieId &&
        key == other.key;
  }

  @override
  int get hashCode => videoId.hashCode ^ serieId.hashCode ^ key.hashCode;
}

/// generated route for
/// [VideoPlayerPage]
class VideoPlayerRoute extends PageRouteInfo<VideoPlayerRouteArgs> {
  VideoPlayerRoute({
    required int videoId,
    int? serieId,
    String? title,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         VideoPlayerRoute.name,
         args: VideoPlayerRouteArgs(
           videoId: videoId,
           serieId: serieId,
           title: title,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'VideoPlayerRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VideoPlayerRouteArgs>();
      return VideoPlayerPage(
        videoId: args.videoId,
        serieId: args.serieId,
        title: args.title,
        key: args.key,
      );
    },
  );
}

class VideoPlayerRouteArgs {
  const VideoPlayerRouteArgs({
    required this.videoId,
    this.serieId,
    this.title,
    this.key,
  });

  final int videoId;

  final int? serieId;

  final String? title;

  final Key? key;

  @override
  String toString() {
    return 'VideoPlayerRouteArgs{videoId: $videoId, serieId: $serieId, title: $title, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! VideoPlayerRouteArgs) return false;
    return videoId == other.videoId &&
        serieId == other.serieId &&
        title == other.title &&
        key == other.key;
  }

  @override
  int get hashCode =>
      videoId.hashCode ^ serieId.hashCode ^ title.hashCode ^ key.hashCode;
}
