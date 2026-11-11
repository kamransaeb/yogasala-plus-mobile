import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/points/data/datasources/points_remote_data_source.dart';
import 'package:yogasala_plus_mobile/features/points/domain/entities/user_points_balance.dart';
import 'package:yogasala_plus_mobile/features/points/domain/entities/user_points_leaderboard_page.dart';
import 'package:yogasala_plus_mobile/features/points/domain/repositories/points_repository.dart';

/// Implementation of [PointsRepository].
@LazySingleton(as: PointsRepository)
class PointsRepositoryImpl implements PointsRepository {
  /// Creates a [PointsRepositoryImpl].
  PointsRepositoryImpl(this._remote, this._errorHandler);

  final PointsRemoteDataSource _remote;
  final ErrorHandler _errorHandler;

  @override
  Future<Either<Failure, UserPointsBalance>> getUserPoints() async {
    try {
      final model = await _remote.getUserPoints();
      return Right(model.toEntity());
    } on Object catch (e, stackTrace) {
      return Left(
        _errorHandler.handleError(
          e,
          stackTrace: stackTrace,
          reason: 'getUserPoints',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserPointsLeaderboardPage>> getLeaderboard({
    required int page,
    required int size,
  }) async {
    try {
      final response = await _remote.getLeaderboard(page: page, size: size);
      return Right(
        UserPointsLeaderboardPage(
          content: response.content.map((e) => e.toEntity()).toList(),
          page: response.page,
          size: response.size,
          totalElements: response.totalElements,
          totalPages: response.totalPages,
        ),
      );
    } on Object catch (e, stackTrace) {
      return Left(
        _errorHandler.handleError(
          e,
          stackTrace: stackTrace,
          reason: 'getLeaderboard',
        ),
      );
    }
  }
}
