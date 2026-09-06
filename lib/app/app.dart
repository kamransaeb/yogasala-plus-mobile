import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/app/app_config.dart';
import 'package:yogasala_plus_mobile/core/navigation/app_router.dart';
import 'package:yogasala_plus_mobile/core/theme/theme_bloc.dart';
import 'package:yogasala_plus_mobile/di/injection.dart';
import 'package:yogasala_plus_mobile/features/auth/presentation/bloc/auth/auth_bloc.dart';

/// YogaSalaPlusApp is the main app widget
class YogaSalaPlusApp extends StatelessWidget {
  /// Constructor for YogaSalaPlusApp
  const YogaSalaPlusApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = getIt<AppRouter>();
    final appConfig = getIt<AppConfig>();

    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return BlocBuilder<AuthBloc, AuthState>(
          builder: (context, authState) {
            return MaterialApp.router(
              title: appConfig.appName,
              theme: AppTheme.light(seed: Colors.teal),
              darkTheme: AppTheme.dark(seed: Colors.teal),
              themeMode: themeState.currentThemeStatus.themeMode,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              routerConfig: appRouter.config(),
              builder: (context, child) {
                if (authState.isChecking) {
                  return const Scaffold(
                    body: Center(child: AppLoadingIndicator()),
                  );
                }
                return child ?? const SizedBox.shrink();
              },
            );
          },
        );
      },
    );
  }
}
