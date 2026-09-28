import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:yogasala_plus_mobile/features/profile/domain/entities/user_yoga_sala_plus.dart';

/// Repository for user yoga sala plus.
abstract class UserYogaSalaPlusRepository {
  /// Get or create user yoga sala plus open mobile.
  Future<Either<Failure, UserYogaSalaPlus>>
  getOrCreateUserYogaSalaPlusOpenMobile();

  /// Complete user yoga sala plus mobile user.
  Future<Either<Failure, UserYogaSalaPlus>> completeUserYogaSalaPlusMobileUser(
    UserYogaSalaPlus userYogaSalaPlus,
  );

  /// Update user yoga sala plus mobile user.
  Future<Either<Failure, UserYogaSalaPlus>> updateUserYogaSalaPlusMobileUser(
    UserYogaSalaPlus userYogaSalaPlus,
  );

  /// Get user yoga sala plus mobile user.
  Future<Either<Failure, UserYogaSalaPlus>> getUserYogaSalaPlusMobileUser();
}
