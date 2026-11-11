import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/video_player/data/api/playback_api_client.dart';
import 'package:yogasala_plus_mobile/features/video_player/data/datasources/playback_remote_data_source.dart';
import 'package:yogasala_plus_mobile/features/video_player/data/models/playback_model.dart';

/// Implementation of [PlaybackRemoteDataSource].
@LazySingleton(as: PlaybackRemoteDataSource)
class PlaybackRemoteDataSourceImpl implements PlaybackRemoteDataSource {
  /// Creates a [PlaybackRemoteDataSourceImpl].
  PlaybackRemoteDataSourceImpl(this._apiClient);

  final PlaybackApiClient _apiClient;

  @override
  Future<PlaybackModel> getPlayback({
    required int videoId,
    int? serieId,
  }) async {
    final response = await _apiClient.getPlayback(
      id: videoId,
      serieId: serieId,
    );
    return response.data;
  }
}
