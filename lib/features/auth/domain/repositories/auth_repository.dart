import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:yogasala_plus_mobile/features/auth/domain/entities/auth_tokens.dart';
import 'package:yogasala_plus_mobile/features/auth/domain/entities/auth_user.dart';
import 'package:yogasala_plus_mobile/features/profile/domain/entities/user_yoga_sala_plus.dart';

/// The repository for the authentication service.
abstract class AuthRepository {
  /// Logs in a user.
  Future<Either<Failure, AuthUser>> logInWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Logs out a user.
  Future<Either<Failure, void>> logout();

  /// Refreshes the authentication tokens.
  Future<Either<Failure, AuthTokens>> refreshAuthTokens();

  /// Returns a non-expired Firebase ID token, refreshing when needed.
  Future<Either<Failure, String>> getValidAccessToken();

  /// Gets the current user.
  Future<Either<Failure, AuthUser?>> getCurrentAuthUser();

  /// Checks if the user is authenticated.
  Future<bool> isAuthenticated();

  /// Sends a password reset email to the user.
  Future<Either<Failure, void>> sendPasswordResetEmail({
    required String email,
  });

  /// Signs up a user with email and password.
  Future<Either<Failure, void>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });
}
