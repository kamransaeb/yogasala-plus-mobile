// Retrofit’s own examples often hide Dio’s Headers so it doesn’t clash with
// Retrofit’s own Headers.
import 'package:dio/dio.dart' hide Headers;
import 'package:enterprise_network/enterprise_network.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:yogasala_plus_mobile/features/home/data/api/videos_endpoints.dart';
import 'package:yogasala_plus_mobile/features/home/data/models/video_category_model.dart';
import 'package:yogasala_plus_mobile/features/home/data/models/video_model.dart';

part 'videos_api_client.g.dart';

/// Videos / categories API client (authenticated mobile client).
@lazySingleton
@RestApi()
abstract class VideosApiClient {
  /// Factory method for the implementation.
  @factoryMethod
  factory VideosApiClient(DioClient dioClient) =>
      _VideosApiClient(dioClient.dio);

  /// Enabled video categories.
  @GET(VideosEndpoints.videosCategoryListEnabled)
  Future<HttpResponse<List<VideoCategoryModel>>>
  getVideosCategoryListEnabled();

  /// Enabled videos for the given category ids.
  @GET(VideosEndpoints.videosListEnabledByCategoryIds)
  Future<HttpResponse<List<VideoModel>>>
  getVideosListEnabledByCategoryIds({
    @Query('videosCategoryIdList') required List<int> videosCategoryIdList,
  });
}
