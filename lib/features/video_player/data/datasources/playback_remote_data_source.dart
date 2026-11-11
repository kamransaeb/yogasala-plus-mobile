import 'package:yogasala_plus_mobile/features/video_player/data/models/playback_model.dart';

/// Remote data source for signed Mux playback.
abstract class PlaybackRemoteDataSource {
  /// Signed Mux playback for one video.
  Future<PlaybackModel> getPlayback({
    required int videoId,
    int? serieId,
  });
}
