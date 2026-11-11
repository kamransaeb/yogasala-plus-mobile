import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:yogasala_plus_mobile/features/videos/domain/entities/video.dart';
import 'package:yogasala_plus_mobile/features/videos/domain/entities/video_page.dart';

/// Repository for videos.
abstract class VideosRepository {
  /// Playable videos for one series.
  Future<Either<Failure, List<Video>>> getVideosBySerie(int serieId);

  /// Playable videos for one category.
  Future<Either<Failure, List<Video>>> getVideosByCategory(int categoryId);

  /// Playable videos for [categoryIds].
  Future<Either<Failure, List<Video>>> getVideosByCategories(
    List<int> categoryIds,
  );

  /// Video with [Video.favorited] for the current user.
  Future<Either<Failure, Video>> getVideoFavorite(int id);

  /// Mark [id] as favorite for the current user.
  Future<Either<Failure, void>> addVideoFavorite(int id);

  /// Remove [id] from the current user's favorites.
  Future<Either<Failure, void>> removeVideoFavorite(int id);

  /// Paginated favorite videos for the current user.
  Future<Either<Failure, VideoPage>> getFavoriteVideos({
    int page = 0,
    int size = 20,
  });
}
