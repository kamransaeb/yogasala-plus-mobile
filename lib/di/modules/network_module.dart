import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:enterprise_logger/enterprise_logger.dart';
import 'package:enterprise_network/enterprise_network.dart';
import 'package:enterprise_storage/enterprise_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:yogasala_plus_mobile/core/constants/di_constants.dart';
import 'package:yogasala_plus_mobile/core/constants/interceptor_constants.dart';
import 'package:yogasala_plus_mobile/core/constants/storage_constants.dart';
import 'package:yogasala_plus_mobile/core/network/hive_network_cache_store.dart';
import 'package:yogasala_plus_mobile/di/injection.dart';
import 'package:yogasala_plus_mobile/features/app/app_config.dart';
import 'package:yogasala_plus_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:yogasala_plus_mobile/features/auth/presentation/bloc/auth_bloc.dart';

/// Injectable bindings for network utilities and helpers.
@module
abstract class NetworkModule {
  /// Provides [Connectivity] for link-state checks.
  @lazySingleton
  Connectivity get connectivity => Connectivity();

  /// Provides [InternetConnection] for reachability checks.
  @lazySingleton
  InternetConnection get internetConnection => InternetConnection();

  /// Provides [DeviceInfoPlugin] for platform device metadata.
  @lazySingleton
  DeviceInfoPlugin get deviceInfoPlugin => DeviceInfoPlugin();

  /// Provides [NetworkHelper] for connectivity and online checks.
  @lazySingleton
  NetworkHelper networkHelper(
    Connectivity connectivity,
    InternetConnection internetConnection,
    LoggerService logger,
  ) => NetworkHelper(
    logger,
    connectivity: connectivity,
    internetConnection: internetConnection,
  );

  /// Provides [JsonTransformer] for request/response JSON mapping.
  @lazySingleton
  JsonTransformer jsonTransformer(LoggerService logger) =>
      JsonTransformer(logger);

  /// Provides [DeviceNetworkInfo] backed by [DeviceInfoPlugin].
  @lazySingleton
  DeviceNetworkInfo deviceNetworkInfo(DeviceInfoPlugin plugin) =>
      DeviceNetworkInfo(plugin: plugin);

  /// App-owned HTTP config (no AppConfig in packages).
  @lazySingleton
  NetworkClientConfig networkClientConfig(AppConfig appConfig) =>
      NetworkClientConfig(
        baseUrl: appConfig.apiBaseUrl.isNotEmpty
            ? appConfig.apiBaseUrl
            : 'https://jsonplaceholder.typicode.com',
        enableLogging: appConfig.enableLogging,
        // 4xx must be Dio errors so ErrorHandler can read body.error codes
        // (e.g. missing_tenant_id). Default 500 would treat 400 as success and
        // Retrofit would try to fromJson the error payload.
        validateStatusBelow: 400,
      );

  /// Provides [NetworkCacheStore] backed by [HiveNetworkCacheStore] for
  /// caching network requests.
  @lazySingleton
  NetworkCacheStore networkCacheStore(
    @Named(DiConstants.hiveStorage) LocalStorage hiveStorage,
  ) => HiveNetworkCacheStore(hiveStorage);

  /// Provides [Dio] for making HTTP requests.
  @lazySingleton
  Dio dio(DioClient client) => client.dio;

  /// Provides [DioClient] for making HTTP requests.
  @lazySingleton
  DioClient dioClient(
    NetworkClientConfig config,
    LoggerService logger,
    DeviceNetworkInfo deviceInfo,
    @Named(DiConstants.secureStorage) LocalStorage secureStorage,
    NetworkCacheStore cacheStore,
  ) {
    final client = DioClient(
      config,
      logger,
      // Interceptors in order:
      // 1. HeaderInterceptor
      // 2. AuthInterceptor
      // 3. Logging (after auth, before cache — cache can short-circuit)
      // 4. CacheInterceptor
      // 5. RetryInterceptor
      // 6. ErrorInterceptor
      interceptors: [
        HeaderInterceptor(
          deviceInfo,
          () => {NetworkConstants.acceptLanguage: 'en'},
        ),
        AuthInterceptor(
          logger,
          () async {
            final cached = await secureStorage.read<String>(
              StorageConstants.accessToken,
            );
            if (cached != null && cached.isNotEmpty) return cached;
            // Cold start / race: storage empty — refresh from Firebase.
            final result = await getIt<AuthRepository>().refreshAuthTokens();
            return result.fold(
              (_) => null,
              (tokens) =>
                  tokens.accessToken.isEmpty ? null : tokens.accessToken,
            );
          },
          () async {
            final result = await getIt<AuthRepository>().refreshAuthTokens();
            return result.fold(
              (_) => null,
              (tokens) =>
                  tokens.accessToken.isEmpty ? null : tokens.accessToken,
            );
          },
          () async {
            getIt<AuthBloc>().add(const AuthEvent.logoutRequested());
          },
          authorizationHeaderKey: InterceptorConstants.xAuthorizationFirebase,
          authorizationHeaderValuePrefix: '', // raw Firebase id token
        ),
        // After Auth so logs include final headers; before Cache so hits
        // still log.
        if (config.enableLogging) ...[
          LoggingInterceptor(
            logger,
            logBodies: true,
            maxBodyLength: 50 * 1024,
          ),
          LogInterceptor(
            requestBody: true,
            responseBody: true,
            responseHeader: false,
          ),
        ],
        CacheInterceptor(logger, cacheStore),
        RetryInterceptor(logger),
        ErrorInterceptor(logger),
      ],
    );

    // Backend Firebase auth failures often return plain text with
    // Content-Type: application/json. Dio's default FusedTransformer then
    // throws FormatException and drops status/body (Status: null). Use a
    // tolerant decoder so ErrorInterceptor can surface the real message.
    client.dio.transformer = SyncTransformer(
      jsonDecodeCallback: (text) {
        try {
          return jsonDecode(text);
        } on FormatException {
          return text;
        }
      },
    );

    return client;
  }
}
