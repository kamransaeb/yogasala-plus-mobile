/// Serie API path constants (mobile user).
abstract final class SeriesEndpoints {
  /// Playable series for one category.
  static const String seriesByCategory =
      '/mobile/user/categories/{categoryId}/series';

  /// Playable series for multiple category ids (`categoryIds` query).
  static const String seriesByCategories = '/mobile/user/series/by-categories';

  /// Paginated playable series (`page` / `size` / optional `name`).
  static const String series = '/mobile/user/series';

  /// Single series by id.
  static const String serieById = '/mobile/user/series/{id}';
}
