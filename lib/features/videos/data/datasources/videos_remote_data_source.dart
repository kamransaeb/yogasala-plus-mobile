import 'package:yogasala_plus_mobile/features/videos/data/models/video_model.dart';
import 'package:yogasala_plus_mobile/features/videos/data/models/video_page_response_model.dart';

/// Remote data source for videos.
abstract class VideosRemoteDataSource {
  /// Playable videos for one series.
  Future<List<VideoModel>> getVideosBySerie(int serieId);

  /// Playable videos for one category.
  Future<List<VideoModel>> getVideosByCategory(int categoryId);

  /// Playable videos for [categoryIds].
  Future<List<VideoModel>> getVideosByCategories(List<int> categoryIds);

  /// Video with [VideoModel.favorited] for the current user.
  Future<VideoModel> getVideoFavorite(int id);

  /// Mark [id] as favorite for the current user.
  Future<void> addVideoFavorite(int id);

  /// Remove [id] from the current user's favorites.
  Future<void> removeVideoFavorite(int id);

  /// Paginated favorite videos for the current user.
  Future<VideoPageResponseModel> getFavoriteVideos({
    int page = 0,
    int size = 20,
  });
}
