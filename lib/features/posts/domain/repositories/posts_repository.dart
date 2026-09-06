import 'package:yogasala_plus_mobile/features/posts/domain/entities/post.dart';
import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';

/// Posts repository interface
abstract class PostsRepository {
  /// Get a post by ID.
  Future<Either<Failure, Post>> getPost(
    int id, {
    bool forceRefresh = false,
  });

  /// Get a list of posts.
  Future<Either<Failure, List<Post>>> getPosts({int limit = 5});
}
