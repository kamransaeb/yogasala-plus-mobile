import 'package:enterprise_core/enterprise_core.dart'
    hide FirebaseAuthException;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:yogasala_plus_mobile/features/auth/data/models/auth_tokens_model.dart';
import 'package:yogasala_plus_mobile/features/auth/data/models/auth_user_model.dart';
import 'package:yogasala_plus_mobile/features/auth/data/models/token_refresh_response_model.dart';
import 'package:yogasala_plus_mobile/features/login/data/models/login_response_model.dart';

/// The implementation of the [AuthRemoteDataSource].
@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  /// Creates a new [AuthRemoteDataSourceImpl] instance.
  AuthRemoteDataSourceImpl(
    this._firebaseAuth,
  );

  final FirebaseAuth _firebaseAuth;

  @override
  Future<LoginResponseModel> logInWithEmailAndPassword({
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
    final verifiedUser = await _requireVerifiedEmail(user);
    final tokens = await _tokensFromUser(verifiedUser);
    return LoginResponseModel(
      authUser: _mapUser(verifiedUser),
      authTokens: tokens,
    );
  }

  @override
  Future<void> sendPasswordResetEmail({
    required String email,
  }) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email.trim());
  }

  @override
  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (userCredential.user != null) {
      await userCredential.user!.sendEmailVerification();
      await _firebaseAuth.signOut();
    }
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
    final verifiedUser = await _requireVerifiedEmail(user);
    final accessToken = await verifiedUser.getIdToken(true) ?? '';
    final result = await verifiedUser.getIdTokenResult(true);
    final expiresAt =
        result.expirationTime ?? DateTime.now().add(const Duration(hours: 1));
    return TokenRefreshResponseModel(
      accessToken: accessToken,
      refreshToken: refreshToken.isNotEmpty ? refreshToken : accessToken,
      expiresAt: expiresAt,
    );
  }

  @override
  Future<AuthUserModel> currentAuthUser() async {
    final user = _firebaseAuth.currentUser;
    if (user == null) {
      throw FirebaseAuthException(
        code: 'user-not-found',
        message: 'No current user',
      );
    }
    final verifiedUser = await _requireVerifiedEmail(user);
    return _mapUser(verifiedUser);
  }

  /// Reloads [user], requires [User.emailVerified], otherwise signs out.
  Future<User> _requireVerifiedEmail(User user) async {
    await user.reload();
    final refreshed = _firebaseAuth.currentUser;
    if (refreshed == null) {
      throw FirebaseAuthException(
        code: 'user-not-found',
        message: 'No current user',
      );
    }
    if (!refreshed.emailVerified) {
      await _firebaseAuth.signOut();
      throw const EmailNotVerifiedException();
    }
    return refreshed;
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

  AuthUserModel _mapUser(User user) {
    final parts = (user.displayName ?? '').trim().split(RegExp(r'\s+'));
    return AuthUserModel(
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
