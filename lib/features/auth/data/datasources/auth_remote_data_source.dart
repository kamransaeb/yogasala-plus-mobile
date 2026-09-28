import 'package:yogasala_plus_mobile/features/auth/data/models/auth_user_model.dart';
import 'package:yogasala_plus_mobile/features/auth/data/models/token_refresh_response_model.dart';
import 'package:yogasala_plus_mobile/features/login/data/models/login_response_model.dart';

/// The remote data source for the auth API.
abstract class AuthRemoteDataSource {
  /// Logs in a user.
  Future<LoginResponseModel> logInWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Logs out a user.
  Future<void> logout();

  /// Refreshes a token.§
  Future<TokenRefreshResponseModel> refreshToken({
    required String refreshToken,
  });

  /// Gets the current user.
  Future<AuthUserModel> currentAuthUser();

  /// Sends a password reset email to the user.
  Future<void> sendPasswordResetEmail({
    required String email,
  });

  /// Signs up a user with email and password.
  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });
}
