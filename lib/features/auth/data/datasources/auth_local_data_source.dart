import 'package:yogasala_plus_mobile/features/auth/data/models/auth_tokens_model.dart';
import 'package:yogasala_plus_mobile/features/auth/data/models/auth_user_model.dart';

/// The local data source for the auth API.
abstract class AuthLocalDataSource {
  /// Caches the tokens.
  Future<void> cacheAuthTokens(AuthTokensModel authTokens);

  /// Gets the cached tokens.
  Future<AuthTokensModel?> getCachedAuthTokens();

  /// Clears the cached tokens.
  Future<void> clearCachedAuthTokens();

  /// Caches the user.
  Future<void> cacheAuthUser(AuthUserModel authUser);

  /// Gets the cached user.
  Future<AuthUserModel?> getCachedAuthUser();

  /// Clears the cached user.
  Future<void> clearCachedAuthUser();

  /// Clears the session.
  Future<void> clearSession();
}
