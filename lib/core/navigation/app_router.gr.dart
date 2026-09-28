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
/// [PostsDemoPage]
class PostsDemoRoute extends PageRouteInfo<void> {
  const PostsDemoRoute({List<PageRouteInfo>? children})
    : super(PostsDemoRoute.name, initialChildren: children);

  static const String name = 'PostsDemoRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PostsDemoPage();
    },
  );
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
