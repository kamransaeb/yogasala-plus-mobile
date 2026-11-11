import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/live_sessions/data/datasources/live_sessions_remote_data_source.dart';
import 'package:yogasala_plus_mobile/features/live_sessions/domain/entities/live_join.dart';
import 'package:yogasala_plus_mobile/features/live_sessions/domain/entities/live_session.dart';
import 'package:yogasala_plus_mobile/features/live_sessions/domain/repositories/live_sessions_repository.dart';

/// Implementation of [LiveSessionsRepository].
@LazySingleton(as: LiveSessionsRepository)
class LiveSessionsRepositoryImpl implements LiveSessionsRepository {
  /// Creates a [LiveSessionsRepositoryImpl].
  LiveSessionsRepositoryImpl(this._remote, this._errorHandler);

  final LiveSessionsRemoteDataSource _remote;
  final ErrorHandler _errorHandler;

  @override
  Future<Either<Failure, List<LiveSession>>> getLiveSessions({
    int days = 7,
  }) async {
    try {
      final models = await _remote.getLiveSessions(days: days);
      final sessions = models.map((e) => e.toEntity()).toList()
        ..sort((a, b) => a.startsAt.compareTo(b.startsAt));
      return Right(sessions);
    } on Object catch (e, stackTrace) {
      return Left(
        _errorHandler.handleError(
          e,
          stackTrace: stackTrace,
          reason: 'getLiveSessions',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, LiveJoin>> joinLiveSession({
    required int slotId,
    required String occurrenceStart,
  }) async {
    try {
      final model = await _remote.joinLiveSession(
        slotId: slotId,
        occurrenceStart: occurrenceStart,
      );
      return Right(model.toEntity());
    } on Object catch (e, stackTrace) {
      return Left(
        _errorHandler.handleError(
          e,
          stackTrace: stackTrace,
          reason: 'joinLiveSession',
        ),
      );
    }
  }
}
