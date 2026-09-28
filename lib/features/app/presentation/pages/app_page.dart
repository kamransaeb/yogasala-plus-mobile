import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/navigation/app_router.dart';
import 'package:yogasala_plus_mobile/core/theme/brand_theme.dart';
import 'package:yogasala_plus_mobile/core/theme/theme_bloc.dart';
import 'package:yogasala_plus_mobile/di/injection.dart';
import 'package:yogasala_plus_mobile/features/app/app_config.dart';
import 'package:yogasala_plus_mobile/features/app/presentation/bloc/app_bloc.dart';
import 'package:yogasala_plus_mobile/features/auth/presentation/bloc/auth_bloc.dart';

/// Root shell: theme, locale sync, global auth navigation, and
/// [MaterialApp.router].
///
/// AppData boot / force-update / auth routing live in AppDirectorBloc.
class AppPage extends StatelessWidget {
  /// Creates an [AppPage].
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = getIt<AppRouter>();
    final appConfig = getIt<AppConfig>();

    context.read<AppBloc>().add(const AppEvent.loaded());

    return MultiBlocListener(
      listeners: [
        BlocListener<AppBloc, AppState>(
          listenWhen: (previous, current) => previous.locale != current.locale,
          listener: (context, state) {
            final next = Locale(state.locale);
            if (context.locale != next) {
              unawaited(context.setLocale(next));
            }
          },
        ),
        // Covers local logout and remote session loss (e.g. 401 → logout).
        BlocListener<AuthBloc, AuthState>(
          listenWhen: (previous, current) {
            final becameUnauthenticated = current.maybeMap(
              unauthenticated: (_) => true,
              orElse: () => false,
            );
            if (!becameUnauthenticated) return false;
            // Logout emits loading before unauthenticated — treat loading as
            // "was signed in". Skip cold start: initial/checking → unauth.
            return previous.isAuthenticated ||
                previous.maybeMap(loading: (_) => true, orElse: () => false);
          },
          listener: (context, state) {
            unawaited(appRouter.replaceAll([LoginRoute()]));
          },
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return GestureDetector(
            onTap: () {
              final currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus &&
                  currentFocus.focusedChild != null) {
                FocusManager.instance.primaryFocus?.unfocus();
              }
            },
            child: MaterialApp.router(
              debugShowCheckedModeBanner: appConfig.flavor == Flavor.dev,
              title: appConfig.appName,
              theme: BrandTheme.light,
              darkTheme: BrandTheme.dark,
              themeMode: themeState.currentThemeStatus.themeMode,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              routerConfig: appRouter.config(),
            ),
          );
        },
      ),
    );
  }
}
