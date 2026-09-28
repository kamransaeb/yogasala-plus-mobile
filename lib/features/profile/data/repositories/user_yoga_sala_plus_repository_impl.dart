import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/profile/data/datasources/user_yoga_sala_plus_remote_data_source.dart';
import 'package:yogasala_plus_mobile/features/profile/domain/entities/user_yoga_sala_plus.dart';
import 'package:yogasala_plus_mobile/features/profile/domain/repositories/user_yoga_sala_plus_repository.dart';

/// Implementation of the UserYogaSalaPlusRepository interface
@Injectable(as: UserYogaSalaPlusRepository)
class UserYogaSalaPlusRepositoryImpl implements UserYogaSalaPlusRepository {
  /// Constructor.
  UserYogaSalaPlusRepositoryImpl(
    this._userYogaSalaPlusRemoteDataSource,
    this._errorHandler,
  );

  final UserYogaSalaPlusRemoteDataSource _userYogaSalaPlusRemoteDataSource;
  final ErrorHandler _errorHandler;

  /// Get a post by ID.
  @override
  Future<Either<Failure, UserYogaSalaPlus>>
  getOrCreateUserYogaSalaPlusOpenMobile() async {
    try {
      final response = await _userYogaSalaPlusRemoteDataSource
          .getOrCreateUserYogaSalaPlusOpenMobile();
      return Right(response.toEntity());
    } on Object catch (e, stackTrace) {
      return Left(
        _errorHandler.handleError(
          e,
          stackTrace: stackTrace,
          reason: 'getOrCreateUserYogaSalaPlusOpenMobile',
        ),
      );
    }
  }

  /// Complete user yoga sala plus mobile client.
  @override
  Future<Either<Failure, UserYogaSalaPlus>> completeUserYogaSalaPlusMobileUser(
    UserYogaSalaPlus userYogaSalaPlus,
  ) async {
    try {
      final response = await _userYogaSalaPlusRemoteDataSource
          .completeUserYogaSalaPlusMobileUser(
            userYogaSalaPlus.toModel(),
          );
      return Right(response.toEntity());
    } on Object catch (e, stackTrace) {
      return Left(
        _errorHandler.handleError(
          e,
          stackTrace: stackTrace,
          reason: 'completeUserYogaSalaPlusMobileUser',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserYogaSalaPlus>> updateUserYogaSalaPlusMobileUser(
    UserYogaSalaPlus userYogaSalaPlus,
  ) async {
    try {
      final response = await _userYogaSalaPlusRemoteDataSource
          .updateUserYogaSalaPlusMobileUser(
            userYogaSalaPlus.toModel(),
          );
      return Right(response.toEntity());
    } on Object catch (e, stackTrace) {
      return Left(
        _errorHandler.handleError(
          e,
          stackTrace: stackTrace,
          reason: 'updateUserYogaSalaPlusMobileUser',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserYogaSalaPlus>>
  getUserYogaSalaPlusMobileUser() async {
    try {
      final response = await _userYogaSalaPlusRemoteDataSource
          .getUserYogaSalaPlusMobileUser();
      return Right(response.toEntity());
    } on Object catch (e, stackTrace) {
      return Left(
        _errorHandler.handleError(
          e,
          stackTrace: stackTrace,
          reason: 'getUserYogaSalaPlusMobileUser',
        ),
      );
    }
  }
}
