import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/posts/data/api/posts_api_client.dart';
import 'package:yogasala_plus_mobile/features/posts/data/datasources/posts_remote_data_source.dart';
import 'package:yogasala_plus_mobile/features/posts/data/models/post_model.dart';

/// Implementation of the PostsRemoteDataSource interface
@LazySingleton(as: PostsRemoteDataSource)
class PostsRemoteDataSourceImpl implements PostsRemoteDataSource {
  /// Injectable constructor for PostsRemoteDataSourceImpl
  PostsRemoteDataSourceImpl(this._apiClient);
  final PostsApiClient _apiClient;

  @override
  Future<PostModel> getPost(int id, {bool forceRefresh = false}) async {
    final response = forceRefresh
        ? await _apiClient.getPostWithForceRefresh(id)
        : await _apiClient.getPost(id);
    return response.data;
  }

  @override
  Future<List<PostModel>> getPosts({int limit = 5}) async {
    final resposne = await _apiClient.getPosts(limit: limit);
    return resposne.data;
  }
}
