import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:yogasala_plus_mobile/features/home/domain/entities/video.dart';
import 'package:yogasala_plus_mobile/features/home/domain/entities/video_category.dart';

/// Repository for home videos / categories.
abstract class VideosRepository {
  /// Enabled video categories.
  Future<Either<Failure, List<VideoCategory>>> getVideosCategoryListEnabled();

  /// Enabled videos for [videosCategoryIdList].
  Future<Either<Failure, List<Video>>> getVideosListEnabledByCategoryIds(
    List<int> videosCategoryIdList,
  );
}
