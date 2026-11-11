import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:yogasala_plus_mobile/features/video_player/domain/entities/playback.dart';

/// Repository for signed Mux playback.
abstract class PlaybackRepository {
  /// Signed Mux playback for one video.
  Future<Either<Failure, Playback>> getPlayback({
    required int videoId,
    int? serieId,
  });
}
