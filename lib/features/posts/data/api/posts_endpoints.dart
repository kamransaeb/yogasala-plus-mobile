/// Posts HTTP paths (relative to base URL).
abstract final class PostsEndpoints {
  /// List posts (`GET /posts`).
  static const String posts = '/posts';

  /// Single post by id (`GET /posts/{id}`).
  static const String postById = '/posts/{id}';
}
