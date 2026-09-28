import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:yogasala_plus_mobile/bootstrap/initialize_app_services.dart';
import 'package:yogasala_plus_mobile/core/theme/theme_bloc.dart';
import 'package:yogasala_plus_mobile/di/injection.dart';
import 'package:yogasala_plus_mobile/features/app/app_config.dart';
import 'package:yogasala_plus_mobile/features/app/presentation/bloc/app_bloc.dart';
import 'package:yogasala_plus_mobile/features/app/presentation/pages/app_page.dart';
import 'package:yogasala_plus_mobile/features/auth/presentation/bloc/auth_bloc.dart';

/// Bootstrap is the bootstrap class for the app
class Bootstrap {
  Bootstrap._();

  /// Initialize the app
  static Future<void> initialize({
    required Flavor flavor,
    required String envPath,
  }) async {
    WidgetsFlutterBinding.ensureInitialized();

    await dotenv.load(fileName: envPath);
    final appConfig = AppConfig.fromEnv(flavor);

    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(options: appConfig.firebaseOptions);
    }
    await EasyLocalization.ensureInitialized();

    // Register before injectable init so modules can depend on it
    getIt.registerSingleton<AppConfig>(appConfig);
    await configureDependencies();
    await initializeAppServices();

    runApp(
      EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('tr')],
        path: 'assets/lang',
        fallbackLocale: const Locale('en'),
        child: MultiBlocProvider(
          providers: [
            BlocProvider.value(value: getIt<ThemeBloc>()),
            BlocProvider.value(value: getIt<AppBloc>()),
            BlocProvider.value(value: getIt<AuthBloc>()),
          ],
          child: const AppPage(),
        ),
      ),
    );
  }
}
