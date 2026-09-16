import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/app/app_config.dart';
import 'package:yogasala_plus_mobile/core/navigation/app_router.dart';
import 'package:yogasala_plus_mobile/core/theme/brand_theme.dart';
import 'package:yogasala_plus_mobile/core/theme/theme_bloc.dart';
import 'package:yogasala_plus_mobile/di/injection.dart';
import 'package:yogasala_plus_mobile/features/auth/presentation/bloc/auth/auth_bloc.dart';

/// AppMain is the main app widget
class AppMain extends StatelessWidget {
  /// Constructor for AppMain
  const AppMain({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = getIt<AppRouter>();
    final appConfig = getIt<AppConfig>();

    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return BlocBuilder<AuthBloc, AuthState>(
          builder: (context, authState) {
            return GestureDetector(
              onTap: () {
                final currentFocus = FocusScope.of(context);
                //**** if there was a problem with the other one
                // WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
                if (!currentFocus.hasPrimaryFocus &&
                    currentFocus.focusedChild != null) {
                  FocusManager.instance.primaryFocus!.unfocus();
                  //FocusManager.instance.primaryFocus.
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
                builder: (context, child) {
                  if (authState.isChecking) {
                    return const Scaffold(
                      body: Center(child: AppLoadingIndicator()),
                    );
                  }
                  return child ?? const SizedBox.shrink();
                },
              ),
            );
          },
        );
      },
    );
  }
}
