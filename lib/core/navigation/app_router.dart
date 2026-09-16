import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/core/navigation/route_guards.dart';
import 'package:yogasala_plus_mobile/features/auth/presentation/pages/login/login_page.dart';
import 'package:yogasala_plus_mobile/features/posts/presentation/pages/posts_demo_page.dart';

part 'app_router.gr.dart';

/// [AppRouter] is the main router for the app.
@singleton
@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: PostsDemoRoute.page,
      path: '/',
      initial: true,
      guards: const [AuthGuard()],
    ),
    AutoRoute(
      page: LoginRoute.page,
      path: '/login',
      guards: const [AuthGuard(requiresAuth: false)],
    ),
  ];
}
