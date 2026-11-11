import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/categories/data/api/categories_api_client.dart';
import 'package:yogasala_plus_mobile/features/categories/data/datasources/categories_remote_data_source.dart';
import 'package:yogasala_plus_mobile/features/categories/data/models/category_model.dart';

/// Implementation of [CategoriesRemoteDataSource].
@LazySingleton(as: CategoriesRemoteDataSource)
class CategoriesRemoteDataSourceImpl implements CategoriesRemoteDataSource {
  /// Creates a [CategoriesRemoteDataSourceImpl].
  CategoriesRemoteDataSourceImpl(this._apiClient);

  final CategoriesApiClient _apiClient;

  @override
  Future<List<CategoryModel>> getCategoriesEnabled() async {
    final response = await _apiClient.getCategoriesEnabled();
    return response.data;
  }
}
