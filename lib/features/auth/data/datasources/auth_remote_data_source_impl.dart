import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:yogasala_plus_mobile/features/auth/data/models/auth_tokens_model.dart';
import 'package:yogasala_plus_mobile/features/auth/data/models/login_response_model.dart';
import 'package:yogasala_plus_mobile/features/auth/data/models/token_refresh_response_model.dart';
import 'package:yogasala_plus_mobile/features/auth/data/models/user_model.dart';

/// The implementation of the [AuthRemoteDataSource].
@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  /// Creates a new [AuthRemoteDataSourceImpl] instance.
  AuthRemoteDataSourceImpl(
    this._firebaseAuth,
  );

  final FirebaseAuth _firebaseAuth;

  @override
  Future<LoginResponseModel> login({
    required String email,
    required String password,
  }) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );
    final user = credential.user;
    if (user == null) {
      throw FirebaseAuthException(
        code: 'user-not-found',
        message: 'No user returned from Firebase',
      );
    }
    final tokens = await _tokensFromUser(user);
    return LoginResponseModel(
      user: _mapUser(user),
      authTokens: tokens,
    );
  }

  @override
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<TokenRefreshResponseModel> refreshToken({
    required String refreshToken,
  }) async {
    final user = _firebaseAuth.currentUser;
    if (user == null) {
      throw FirebaseAuthException(
        code: 'user-not-found',
        message: 'No current user to refresh',
      );
    }
    final token = await user.getIdToken(true);
    final result = await user.getIdTokenResult(true);
    final expiresAt =
        result.expirationTime ?? DateTime.now().add(const Duration(hours: 1));
    return TokenRefreshResponseModel(
      accessToken: token ?? '',
      refreshToken: refreshToken,
      expiresAt: expiresAt,
    );
  }

  @override
  Future<UserModel> currentUser() async {
    final user = _firebaseAuth.currentUser;
    if (user == null) {
      throw FirebaseAuthException(
        code: 'user-not-found',
        message: 'No current user',
      );
    }
    return _mapUser(user);
  }

  Future<AuthTokensModel> _tokensFromUser(User user) async {
    final token = await user.getIdToken();
    final result = await user.getIdTokenResult();
    final expiresAt =
        result.expirationTime ?? DateTime.now().add(const Duration(hours: 1));
    // Firebase manages refresh internally; store id token for API Authorization
    return AuthTokensModel(
      accessToken: token ?? '',
      refreshToken: token ?? '',
      expiresAt: expiresAt,
    );
  }

  UserModel _mapUser(User user) {
    final parts = (user.displayName ?? '').trim().split(RegExp(r'\s+'));
    return UserModel(
      id: user.uid,
      email: user.email ?? '',
      firstName: parts.isNotEmpty && parts.first.isNotEmpty
          ? parts.first
          : null,
      lastName: parts.length > 1 ? parts.sublist(1).join(' ') : null,
      avatarUrl: user.photoURL,
      emailVerified: user.emailVerified,
    );
  }
}
