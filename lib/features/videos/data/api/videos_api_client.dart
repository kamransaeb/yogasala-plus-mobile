// Retrofit’s own examples often hide Dio’s Headers so it doesn’t clash with
// Retrofit’s own Headers.
import 'package:dio/dio.dart' hide Headers;
import 'package:enterprise_network/enterprise_network.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:yogasala_plus_mobile/features/videos/data/api/videos_endpoints.dart';
import 'package:yogasala_plus_mobile/features/videos/data/models/video_model.dart';
import 'package:yogasala_plus_mobile/features/videos/data/models/video_page_response_model.dart';

part 'videos_api_client.g.dart';

/// Videos API client (authenticated mobile user).
@lazySingleton
@RestApi()
abstract class VideosApiClient {
  /// Factory method for the implementation.
  @factoryMethod
  factory VideosApiClient(DioClient dioClient) =>
      _VideosApiClient(dioClient.dio);

  /// Playable videos for one series.
  @GET(VideosEndpoints.videosBySerie)
  @Extra({NetworkConstants.forceRefreshExtraKey: true})
  Future<HttpResponse<List<VideoModel>>> getVideosBySerie({
    @Path('id') required int serieId,
  });

  /// Playable videos for one category.
  @GET(VideosEndpoints.videosByCategory)
  @Extra({NetworkConstants.forceRefreshExtraKey: true})
  Future<HttpResponse<List<VideoModel>>> getVideosByCategory({
    @Path('categoryId') required int categoryId,
  });

  /// Playable videos for the given category ids.
  @GET(VideosEndpoints.videosByCategories)
  @Extra({NetworkConstants.forceRefreshExtraKey: true})
  Future<HttpResponse<List<VideoModel>>> getVideosByCategories({
    @Query('categoryIds') required List<int> categoryIds,
  });

  /// Video with favorite status for the current user.
  @GET(VideosEndpoints.videoFavorite)
  @Extra({NetworkConstants.forceRefreshExtraKey: true})
  Future<HttpResponse<VideoModel>> getVideoFavorite({
    @Path('id') required int id,
  });

  /// Mark [id] as favorite for the current user.
  @POST(VideosEndpoints.videoFavorite)
  @Extra({NetworkConstants.forceRefreshExtraKey: true})
  Future<HttpResponse<void>> addVideoFavorite({
    @Path('id') required int id,
  });

  /// Remove [id] from the current user's favorites.
  @DELETE(VideosEndpoints.videoFavorite)
  @Extra({NetworkConstants.forceRefreshExtraKey: true})
  Future<HttpResponse<void>> removeVideoFavorite({
    @Path('id') required int id,
  });

  /// Paginated favorite videos for the current user.
  @GET(VideosEndpoints.favoriteVideos)
  @Extra({NetworkConstants.forceRefreshExtraKey: true})
  Future<HttpResponse<VideoPageResponseModel>> getFavoriteVideos({
    @Query('page') int page = 0,
    @Query('size') int size = 20,
  });
}
