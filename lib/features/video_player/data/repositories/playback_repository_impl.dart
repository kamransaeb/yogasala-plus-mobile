import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/video_player/data/datasources/playback_remote_data_source.dart';
import 'package:yogasala_plus_mobile/features/video_player/domain/entities/playback.dart';
import 'package:yogasala_plus_mobile/features/video_player/domain/repositories/playback_repository.dart';

/// Implementation of [PlaybackRepository].
@LazySingleton(as: PlaybackRepository)
class PlaybackRepositoryImpl implements PlaybackRepository {
  /// Creates a [PlaybackRepositoryImpl].
  PlaybackRepositoryImpl(this._remote, this._errorHandler);

  final PlaybackRemoteDataSource _remote;
  final ErrorHandler _errorHandler;

  @override
  Future<Either<Failure, Playback>> getPlayback({
    required int videoId,
    int? serieId,
  }) async {
    try {
      final model = await _remote.getPlayback(
        videoId: videoId,
        serieId: serieId,
      );
      return Right(model.toEntity());
    } on Object catch (e, stackTrace) {
      return Left(
        _errorHandler.handleError(
          e,
          stackTrace: stackTrace,
          reason: 'getPlayback',
        ),
      );
    }
  }
}
