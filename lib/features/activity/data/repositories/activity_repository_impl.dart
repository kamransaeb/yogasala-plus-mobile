import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/core/enums/activity_type.dart';
import 'package:yogasala_plus_mobile/features/activity/data/datasources/activity_remote_data_source.dart';
import 'package:yogasala_plus_mobile/features/activity/domain/entities/user_activity_day.dart';
import 'package:yogasala_plus_mobile/features/activity/domain/entities/user_activity_streak.dart';
import 'package:yogasala_plus_mobile/features/activity/domain/repositories/activity_repository.dart';

/// Implementation of [ActivityRepository].
@LazySingleton(as: ActivityRepository)
class ActivityRepositoryImpl implements ActivityRepository {
  /// Creates an [ActivityRepositoryImpl].
  ActivityRepositoryImpl(this._remote, this._errorHandler);

  final ActivityRemoteDataSource _remote;
  final ErrorHandler _errorHandler;

  @override
  Future<Either<Failure, void>> markActivity(ActivityType type) async {
    try {
      await _remote.markActivity(type);
      return const Right(null);
    } on Object catch (e, stackTrace) {
      return Left(
        _errorHandler.handleError(
          e,
          stackTrace: stackTrace,
          reason: 'markActivity',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<UserActivityDay>>> getActivity({
    required String from,
    required String to,
  }) async {
    try {
      final models = await _remote.getActivity(from: from, to: to);
      return Right(models.map((e) => e.toEntity()).toList());
    } on Object catch (e, stackTrace) {
      return Left(
        _errorHandler.handleError(
          e,
          stackTrace: stackTrace,
          reason: 'getActivity',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserActivityStreak>> getStreak() async {
    try {
      final model = await _remote.getStreak();
      return Right(model.toEntity());
    } on Object catch (e, stackTrace) {
      return Left(
        _errorHandler.handleError(
          e,
          stackTrace: stackTrace,
          reason: 'getStreak',
        ),
      );
    }
  }
}
