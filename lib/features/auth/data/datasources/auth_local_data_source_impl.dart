import 'dart:convert';

import 'package:enterprise_storage/enterprise_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/core/constants/di_constants.dart';
import 'package:yogasala_plus_mobile/core/constants/storage_constants.dart';
import 'package:yogasala_plus_mobile/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:yogasala_plus_mobile/features/auth/data/models/auth_tokens_model.dart';
import 'package:yogasala_plus_mobile/features/auth/data/models/auth_user_model.dart';

/// The implementation of the [AuthLocalDataSource].
@LazySingleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  /// Creates a new [AuthLocalDataSourceImpl] instance.
  AuthLocalDataSourceImpl(
    @Named(DiConstants.secureStorage) this._secureStorage,
  );

  final LocalStorage _secureStorage;

  @override
  Future<void> cacheAuthTokens(AuthTokensModel authTokens) async {
    await _secureStorage.write(
      StorageConstants.accessToken,
      authTokens.accessToken,
    );
    await _secureStorage.write(
      StorageConstants.refreshToken,
      authTokens.refreshToken,
    );
    await _secureStorage.write(
      StorageConstants.tokenExpiresAt,
      authTokens.expiresAt.toIso8601String(),
    );
    await _secureStorage.write(
      StorageConstants.tokensKey,
      jsonEncode(authTokens.toJson()),
    );
  }

  @override
  Future<AuthTokensModel?> getCachedAuthTokens() async {
    final raw = await _secureStorage.read<String>(StorageConstants.tokensKey);
    if (raw == null || raw.isEmpty) {
      // Fallback to individual keys if bundle missing
      final accessToken = await _secureStorage.read<String>(
        StorageConstants.accessToken,
      );
      final refreshToken = await _secureStorage.read<String>(
        StorageConstants.refreshToken,
      );
      final expiresAt = await _secureStorage.read<String>(
        StorageConstants.tokenExpiresAt,
      );
      if (accessToken == null || refreshToken == null || expiresAt == null) {
        return null;
      }
      return AuthTokensModel(
        accessToken: accessToken,
        refreshToken: refreshToken,
        expiresAt: DateTime.parse(expiresAt),
      );
    }
    return AuthTokensModel.fromJson(jsonDecode(raw) as Map<String, dynamic>);
  }

  @override
  Future<void> clearCachedAuthTokens() async {
    await _secureStorage.delete(StorageConstants.accessToken);
    await _secureStorage.delete(StorageConstants.refreshToken);
    await _secureStorage.delete(StorageConstants.tokenExpiresAt);
    await _secureStorage.delete(StorageConstants.tokensKey);
  }

  @override
  Future<void> cacheAuthUser(AuthUserModel authUserModel) async {
    await _secureStorage.write(
      StorageConstants.userKey,
      jsonEncode(authUserModel.toJson()),
    );
  }

  @override
  Future<AuthUserModel?> getCachedAuthUser() async {
    final raw = await _secureStorage.read<String>(StorageConstants.userKey);
    if (raw == null || raw.isEmpty) return null;
    return AuthUserModel.fromJson(jsonDecode(raw) as Map<String, dynamic>);
  }

  @override
  Future<void> clearCachedAuthUser() async {
    await _secureStorage.delete(StorageConstants.userKey);
  }

  @override
  Future<void> clearSession() async {
    await clearCachedAuthTokens();
    await clearCachedAuthUser();
    await _secureStorage.delete(StorageConstants.sessionActive);
  }
}
