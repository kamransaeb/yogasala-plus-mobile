import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:yogasala_plus_mobile/firebase_options_dev.dart' as dev;
import 'package:yogasala_plus_mobile/firebase_options_prod.dart' as prod;
import 'package:yogasala_plus_mobile/firebase_options_staging.dart' as staging;

/// Flavor is the environment of the app
enum Flavor {
  /// Development environment
  dev,

  /// Staging environment
  staging,

  /// Production environment
  prod,
}

/// AppConfig is the configuration of the app
class AppConfig {
  /// Constructor for AppConfig
  const AppConfig({
    required this.flavor,
    required this.appName,
    required this.apiBaseUrl,
    required this.enableLogging,
    required this.firebaseOptions,
  });

  /// Factory constructor for AppConfig
  factory AppConfig.fromEnv(Flavor flavor) {
    return AppConfig(
      flavor: flavor,
      appName: dotenv.env['APP_NAME'] ?? 'Yoga Sala Plus',
      apiBaseUrl: dotenv.env['API_BASE_URL'] ?? '',
      enableLogging: dotenv.env['ENABLE_LOGGING']?.toLowerCase() == 'true',
      firebaseOptions: _firebaseOptions(flavor),
    );
  }

  /// Flavor of the app
  final Flavor flavor;

  /// Name of the app
  final String appName;

  /// Base URL of the API
  final String apiBaseUrl;

  /// Whether to enable logging
  final bool enableLogging;

  /// Firebase options
  final FirebaseOptions firebaseOptions;

  /// Private method to get the Firebase options
  static FirebaseOptions _firebaseOptions(Flavor flavor) {
    switch (flavor) {
      case Flavor.dev:
        return dev.DefaultFirebaseOptions.currentPlatform;
      case Flavor.staging:
        return staging.DefaultFirebaseOptions.currentPlatform;
      case Flavor.prod:
        return prod.DefaultFirebaseOptions.currentPlatform;
    }
  }

  /// Whether the app is in development environment
  bool get isDev => flavor == Flavor.dev;

  /// Whether the app is in staging environment
  bool get isStaging => flavor == Flavor.staging;

  /// Whether the app is in production environment
  bool get isProd => flavor == Flavor.prod;
}
