/// Video API path constants (mobile user).
abstract final class VideosEndpoints {
  /// Playable videos for one series.
  static const String videosBySerie = '/mobile/user/series/{id}/videos';

  /// Playable videos for one category.
  static const String videosByCategory =
      '/mobile/user/categories/{categoryId}/videos';

  /// Playable videos for multiple category ids (`categoryIds` query).
  static const String videosByCategories = '/mobile/user/videos';

  /// Get / add / remove current user's favorite for a video.
  static const String videoFavorite = '/mobile/user/videos/{id}/favorite';

  /// Paginated favorite videos for the current user.
  static const String favoriteVideos = '/mobile/user/favorites';
}
