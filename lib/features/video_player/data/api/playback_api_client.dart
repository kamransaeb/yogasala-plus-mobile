import 'package:dio/dio.dart' hide Headers;
import 'package:enterprise_network/enterprise_network.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:yogasala_plus_mobile/features/video_player/data/api/playback_endpoints.dart';
import 'package:yogasala_plus_mobile/features/video_player/data/models/playback_model.dart';

part 'playback_api_client.g.dart';

/// Playback API client (authenticated mobile user).
@lazySingleton
@RestApi()
abstract class PlaybackApiClient {
  /// Factory method for the implementation.
  @factoryMethod
  factory PlaybackApiClient(DioClient dioClient) =>
      _PlaybackApiClient(dioClient.dio);

  /// Signed Mux playback for one video.
  @GET(PlaybackEndpoints.videoPlayback)
  @Extra({NetworkConstants.forceRefreshExtraKey: true})
  Future<HttpResponse<PlaybackModel>> getPlayback({
    @Path('id') required int id,
    @Query('seriesId') int? serieId,
  });
}
