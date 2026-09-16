import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/navigation/app_router.dart';
import 'package:yogasala_plus_mobile/features/auth/presentation/bloc/auth/auth_bloc.dart';

/// Redirects guests away from protected routes and authed users away from login.
class AuthGuard extends AutoRouteGuard {
  /// The constructor for the auth guard.
  const AuthGuard({this.requiresAuth = true});

  /// Whether the guard requires authentication.
  final bool requiresAuth;

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    final context = router.navigatorKey.currentContext;
    if (context == null) {
      resolver.resolveNext(true);
      return;
    }

    final authBloc = context.read<AuthBloc>();

    if (authBloc.state.isChecking) {
      await authBloc.stream.firstWhere((state) => !state.isChecking);
    }

    final isAuthenticated = authBloc.state.isAuthenticated;

    if (isAuthenticated == requiresAuth) {
      resolver.resolveNext(true);
      return;
    }

    if (requiresAuth) {
      // Do NOT await push, and do NOT resolveNext(false) here.
      unawaited(
        router.push(
          LoginRoute(
            onResult: ({success}) {
              // true  → continue to PostsDemo (or whatever was blocked)
              // false → stay blocked / cancel
              resolver.resolveNext(success == true);
            },
          ),
        ),
      );
      return;
    } else {
      await router.replace(const PostsDemoRoute());
      resolver.resolveNext(false);
    }
  }
}
