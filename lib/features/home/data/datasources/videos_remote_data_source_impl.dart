import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/home/data/api/videos_api_client.dart';
import 'package:yogasala_plus_mobile/features/home/data/datasources/videos_remote_data_source.dart';
import 'package:yogasala_plus_mobile/features/home/data/models/video_category_model.dart';
import 'package:yogasala_plus_mobile/features/home/data/models/video_model.dart';

/// Implementation of [VideosRemoteDataSource].
@LazySingleton(as: VideosRemoteDataSource)
class VideosRemoteDataSourceImpl implements VideosRemoteDataSource {
  /// Creates a [VideosRemoteDataSourceImpl].
  VideosRemoteDataSourceImpl(this._apiClient);

  final VideosApiClient _apiClient;

  @override
  Future<List<VideoCategoryModel>> getVideosCategoryListEnabled() async {
    final response = await _apiClient.getVideosCategoryListEnabled();
    return response.data;
  }

  @override
  Future<List<VideoModel>> getVideosListEnabledByCategoryIds(
    List<int> videosCategoryIdList,
  ) async {
    final response = await _apiClient.getVideosListEnabledByCategoryIds(
      videosCategoryIdList: videosCategoryIdList,
    );
    return response.data;
  }
}
