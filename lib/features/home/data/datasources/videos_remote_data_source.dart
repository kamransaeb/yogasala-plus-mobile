import 'package:yogasala_plus_mobile/features/home/data/models/video_category_model.dart';
import 'package:yogasala_plus_mobile/features/home/data/models/video_model.dart';

/// Remote data source for home videos / categories.
abstract class VideosRemoteDataSource {
  /// Enabled video categories.
  Future<List<VideoCategoryModel>> getVideosCategoryListEnabled();

  /// Enabled videos for [videosCategoryIdList].
  Future<List<VideoModel>> getVideosListEnabledByCategoryIds(
    List<int> videosCategoryIdList,
  );
}
