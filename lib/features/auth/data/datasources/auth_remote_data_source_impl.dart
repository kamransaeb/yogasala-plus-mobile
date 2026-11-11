import 'package:enterprise_core/enterprise_core.dart'
    hide FirebaseAuthException;
import 'package:enterprise_core/enterprise_core.dart' as core
    show FirebaseAuthException;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/errors/firebase_error_codes.dart';
import 'package:yogasala_plus_mobile/features/auth/data/api/auth_api_client.dart';
import 'package:yogasala_plus_mobile/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:yogasala_plus_mobile/features/auth/data/models/auth_tokens_model.dart';
import 'package:yogasala_plus_mobile/features/auth/data/models/auth_user_model.dart';
import 'package:yogasala_plus_mobile/features/auth/data/models/token_refresh_response_model.dart';
import 'package:yogasala_plus_mobile/features/login/data/models/login_response_model.dart';

/// The implementation of the [AuthRemoteDataSource].
///
/// Firebase SDK auth errors are converted per call: `network-request-failed`
/// becomes [NoInternetConnectionException]; any other code becomes a core
/// [core.FirebaseAuthException] carrying the Firebase code, which
/// `ErrorHandler` maps to a [FirebaseFailure].
@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  /// Creates a new [AuthRemoteDataSourceImpl] instance.
  AuthRemoteDataSourceImpl(
    this._firebaseAuth,
    this._authApiClient,
  );

  final AuthApiClient _authApiClient;

  final FirebaseAuth _firebaseAuth;

  @override
  Future<LoginResponseModel> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      final user = credential.user;
      if (user == null) {
        throw FirebaseAuthException(
          code: FirebaseErrorCodes.userNotFound,
          message: 'No user returned from Firebase',
        );
      }
      final verifiedUser = await _requireVerifiedEmail(user);
      final tokens = await _tokensFromUser(verifiedUser);
      return LoginResponseModel(
        authUser: _mapUser(verifiedUser),
        authTokens: tokens,
      );
    } on FirebaseAuthException catch (e, stackTrace) {
      if (e.code == FirebaseErrorCodes.networkRequestFailed) {
        throw const NoInternetConnectionException();
      }
      throw core.FirebaseAuthException(
        message: e.message ?? e.code,
        firebaseErrorCode: e.code,
        serviceError: e,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<void> sendPasswordResetEmail({
    required String email,
  }) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email.trim());
    } on FirebaseAuthException catch (e, stackTrace) {
      if (e.code == FirebaseErrorCodes.networkRequestFailed) {
        throw const NoInternetConnectionException();
      }
      throw core.FirebaseAuthException(
        message: e.message ?? e.code,
        firebaseErrorCode: e.code,
        serviceError: e,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        await userCredential.user!.sendEmailVerification();
        await _firebaseAuth.signOut();
      }
    } on FirebaseAuthException catch (e, stackTrace) {
      if (e.code == FirebaseErrorCodes.networkRequestFailed) {
        throw const NoInternetConnectionException();
      }
      throw core.FirebaseAuthException(
        message: e.message ?? e.code,
        firebaseErrorCode: e.code,
        serviceError: e,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e, stackTrace) {
      if (e.code == FirebaseErrorCodes.networkRequestFailed) {
        throw const NoInternetConnectionException();
      }
      throw core.FirebaseAuthException(
        message: e.message ?? e.code,
        firebaseErrorCode: e.code,
        serviceError: e,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<TokenRefreshResponseModel> refreshToken({
    required String refreshToken,
  }) async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user == null) {
        throw FirebaseAuthException(
          code: FirebaseErrorCodes.userNotFound,
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
    } on FirebaseAuthException catch (e, stackTrace) {
      // Offline / throttled during refresh is transient: keep the session.
      if (e.code == FirebaseErrorCodes.networkRequestFailed ||
          e.code == FirebaseErrorCodes.tooManyRequests) {
        throw const NoInternetConnectionException();
      }
      throw core.FirebaseAuthException(
        message: e.message ?? e.code,
        firebaseErrorCode: e.code,
        serviceError: e,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<AuthUserModel> currentAuthUser() async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user == null) {
        throw FirebaseAuthException(
          code: FirebaseErrorCodes.userNotFound,
          message: 'No current user',
        );
      }
      final verifiedUser = await _requireVerifiedEmail(user);
      return _mapUser(verifiedUser);
    } on FirebaseAuthException catch (e, stackTrace) {
      if (e.code == FirebaseErrorCodes.networkRequestFailed) {
        throw const NoInternetConnectionException();
      }
      throw core.FirebaseAuthException(
        message: e.message ?? e.code,
        firebaseErrorCode: e.code,
        serviceError: e,
        stackTrace: stackTrace,
      );
    }
  }

  /// Reloads [user], requires [User.emailVerified], otherwise signs out.
  Future<User> _requireVerifiedEmail(User user) async {
    await user.reload();
    final refreshed = _firebaseAuth.currentUser;
    if (refreshed == null) {
      throw FirebaseAuthException(
        code: FirebaseErrorCodes.userNotFound,
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
