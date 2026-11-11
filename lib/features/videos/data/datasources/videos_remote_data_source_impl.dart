import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/videos/data/api/videos_api_client.dart';
import 'package:yogasala_plus_mobile/features/videos/data/datasources/videos_remote_data_source.dart';
import 'package:yogasala_plus_mobile/features/videos/data/models/video_model.dart';
import 'package:yogasala_plus_mobile/features/videos/data/models/video_page_response_model.dart';

/// Implementation of [VideosRemoteDataSource].
@LazySingleton(as: VideosRemoteDataSource)
class VideosRemoteDataSourceImpl implements VideosRemoteDataSource {
  /// Creates a [VideosRemoteDataSourceImpl].
  VideosRemoteDataSourceImpl(this._apiClient);

  final VideosApiClient _apiClient;

  @override
  Future<List<VideoModel>> getVideosBySerie(int serieId) async {
    final response = await _apiClient.getVideosBySerie(serieId: serieId);
    return response.data;
  }

  @override
  Future<List<VideoModel>> getVideosByCategory(int categoryId) async {
    final response = await _apiClient.getVideosByCategory(
      categoryId: categoryId,
    );
    return response.data;
  }

  @override
  Future<List<VideoModel>> getVideosByCategories(
    List<int> categoryIds,
  ) async {
    final response = await _apiClient.getVideosByCategories(
      categoryIds: categoryIds,
    );
    return response.data;
  }

  @override
  Future<VideoModel> getVideoFavorite(int id) async {
    final response = await _apiClient.getVideoFavorite(id: id);
    return response.data;
  }

  @override
  Future<void> addVideoFavorite(int id) async {
    await _apiClient.addVideoFavorite(id: id);
  }

  @override
  Future<void> removeVideoFavorite(int id) async {
    await _apiClient.removeVideoFavorite(id: id);
  }

  @override
  Future<VideoPageResponseModel> getFavoriteVideos({
    int page = 0,
    int size = 20,
  }) async {
    final response = await _apiClient.getFavoriteVideos(
      page: page,
      size: size,
    );
    return response.data;
  }
}
