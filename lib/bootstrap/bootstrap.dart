import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:yogasala_plus_mobile/app/app.dart';
import 'package:yogasala_plus_mobile/app/app_config.dart';
import 'package:yogasala_plus_mobile/bootstrap/initialize_app_services.dart';
import 'package:yogasala_plus_mobile/core/theme/theme_bloc.dart';
import 'package:yogasala_plus_mobile/di/injection.dart';
import 'package:yogasala_plus_mobile/features/auth/presentation/bloc/auth/auth_bloc.dart';

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

    await Firebase.initializeApp(options: appConfig.firebaseOptions);
    await EasyLocalization.ensureInitialized();

    // Register before injectable init so modules can depend on it
    getIt.registerSingleton<AppConfig>(appConfig);
    await configureDependencies();
    await initializeAppServices();

    runApp(
      EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('tr')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        child: MultiBlocProvider(
          providers: [
            BlocProvider.value(value: getIt<ThemeBloc>()),
            BlocProvider.value(
              value: getIt<AuthBloc>()
                ..add(const AuthEvent.checkStatusRequested()),
            ),
          ],
          child: const YogaSalaPlusApp(),
        ),
      ),
    );
  }
}
