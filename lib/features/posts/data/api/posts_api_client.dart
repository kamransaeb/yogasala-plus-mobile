// Retrofit’s own examples often hide Dio’s Headers so it doesn’t clash with 
// Retrofit’s own Headers
import 'package:dio/dio.dart' hide Headers;
import 'package:enterprise_network/enterprise_network.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:yogasala_plus_mobile/features/posts/data/api/posts_endpoints.dart';
import 'package:yogasala_plus_mobile/features/posts/data/models/post_model.dart';

part 'posts_api_client.g.dart';

/// Posts API client interface implementation.
@lazySingleton
@RestApi()
abstract class PostsApiClient {
  /// Factory method for the implementation.
  @factoryMethod
  factory PostsApiClient(DioClient dioClient) => _PostsApiClient(dioClient.dio);

  /// Public demo endpoint — skip auth, allow cache.
  @GET(PostsEndpoints.postById)
  @Extra({
    NetworkConstants.skipAuthExtraKey: true,
  })
  Future<HttpResponse<PostModel>> getPost(@Path('id') int id);

  /// Public demo endpoint — skip auth, force refresh.
  @GET(PostsEndpoints.postById)
  @Extra({
    NetworkConstants.skipAuthExtraKey: true,
    NetworkConstants.forceRefreshExtraKey: true,
  })
  Future<HttpResponse<PostModel>> getPostWithForceRefresh(@Path('id') int id);

  /// Get all posts
  @GET(PostsEndpoints.posts)
  @Extra({NetworkConstants.skipAuthExtraKey: true})
  Future<HttpResponse<List<PostModel>>> getPosts({
    @Query('limit') int? limit = 5,
  });
}
