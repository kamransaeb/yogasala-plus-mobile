/// Home / videos API path constants.
abstract final class VideosEndpoints {
  /// Enabled video categories (mobile client).
  static const String videosCategoryListEnabled =
      '/mobile/client/videos-category/enabled';

  /// Enabled videos filtered by category id list (mobile client).
  static const String videosListEnabledByCategoryIds =
      '/mobile/client/videos/enabled/videos-category-id-list';
}
