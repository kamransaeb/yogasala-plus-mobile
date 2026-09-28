import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:yogasala_plus_mobile/core/navigation/app_router.dart';
import 'package:yogasala_plus_mobile/di/injection.dart';
import 'package:yogasala_plus_mobile/features/auth/presentation/bloc/auth_bloc.dart';

/// Redirects guests away from protected routes and authed users away from
/// login.
///
/// Guards run only when a route is navigated to.
/// AppDirectorRoute is unguarded and routes to Login or Profile after boot.
/// Session loss while already on a protected page is handled by AppPage's
/// global AuthBloc listener via `replaceAll([LoginRoute()])`.
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
    // Prefer GetIt over BuildContext so we never allow a protected route
    // when the navigator context is not ready yet.
    final authBloc = getIt<AuthBloc>();

    // Ensure we have finished Firebase session restore before deciding.
    if (!authBloc.state.hasAuthDecision) {
      if (authBloc.state.maybeMap(initial: (_) => true, orElse: () => false)) {
        authBloc.add(const AuthEvent.checkStatusRequested());
      }
      await authBloc.stream.firstWhere((state) => state.hasAuthDecision);
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
              // true  → continue to the protected route
              // false → stay blocked / cancel
              resolver.resolveNext(success == true);
            },
          ),
        ),
      );
      return;
    } else {
      // So a shared page (e.g. marketing, help, public post) should be an
      // unguarded route.
      await router.replace(const AppDirectorRoute());
      resolver.resolveNext(false);
    }
  }
}
