import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:yogasala_plus_mobile/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:yogasala_plus_mobile/features/auth/domain/entities/auth_tokens.dart';
import 'package:yogasala_plus_mobile/features/auth/domain/entities/auth_user.dart';
import 'package:yogasala_plus_mobile/features/auth/domain/repositories/auth_repository.dart';

/// The implementation of the [AuthRepository].
@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  /// Creates a new [AuthRepositoryImpl] instance.
  AuthRepositoryImpl(
    this._remote,
    this._local,
    this._errorHandler,
  );

  final AuthLocalDataSource _local;
  final AuthRemoteDataSource _remote;
  final ErrorHandler _errorHandler;

  @override
  Future<Either<Failure, AuthUser>> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _remote.logInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _local.cacheAuthTokens(
        response.authTokens,
      );
      await _local.cacheAuthUser(
        response.authUser,
      );
      return Right(response.authUser.toEntity());
    } on Object catch (e, stackStrace) {
      return Left(_errorHandler.handleError(e, stackTrace: stackStrace));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await _remote.logout();
    } on Object catch (e, stackTrace) {
      // Still clear local session if network logout fails
      _errorHandler.handleError(e, stackTrace: stackTrace, reason: 'logout');
    }
    try {
      await _local.clearSession();
    } on Object catch (e, stackTrace) {
      return Left(
        _errorHandler.handleError(e, stackTrace: stackTrace, reason: 'logout'),
      );
    }
    return const Right(null);
  }

  @override
  Future<Either<Failure, AuthTokens>> refreshAuthTokens() async {
    try {
      // *** Firebase refresh uses currentUser.getIdToken, cached refresh token
      // is optional.
      final cached = await _local.getCachedAuthTokens();
      final response = await _remote.refreshToken(
        refreshToken: cached?.refreshToken ?? '',
      );
      final tokens = response.toAuthTokensModel();
      await _local.cacheAuthTokens(tokens);
      return Right(tokens.toEntity());
    } on Object catch (e, stackTrace) {
      return Left(
        _errorHandler.handleError(
          e,
          stackTrace: stackTrace,
          reason: 'refreshTokens',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, AuthUser?>> getCurrentAuthUser() async {
    try {
      final remote = await _remote.currentAuthUser();
      await _local.cacheAuthUser(remote);
      return Right(remote.toEntity());
    } on Object catch (e, stackTrace) {
      return Left(
        _errorHandler.handleError(
          e,
          stackTrace: stackTrace,
          reason: 'getCurrentAuthUser',
        ),
      );
    }
  }

  @override
  Future<bool> isAuthenticated() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return false;

    await user.reload();
    final current = FirebaseAuth.instance.currentUser;
    if (current == null || !current.emailVerified) {
      try {
        await _remote.logout();
      } on Object catch (e, stackTrace) {
        _errorHandler.handleError(
          e,
          stackTrace: stackTrace,
          reason: 'isAuthenticated',
        );
      }
      try {
        await _local.clearSession();
      } on Object catch (e, stackTrace) {
        _errorHandler.handleError(
          e,
          stackTrace: stackTrace,
          reason: 'isAuthenticated',
        );
      }
      return false;
    }
    return true;
  }

  @override
  Future<Either<Failure, void>> sendPasswordResetEmail({
    required String email,
  }) async {
    try {
      await _remote.sendPasswordResetEmail(email: email);
      return const Right(null);
    } on Object catch (e, stackTrace) {
      return Left(_errorHandler.handleError(e, stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<Failure, void>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _remote.signUpWithEmailAndPassword(
        email: email,
        password: password,
      );
      return const Right(null);
    } on Object catch (e, stackTrace) {
      return Left(_errorHandler.handleError(e, stackTrace: stackTrace));
    }
  }
}
