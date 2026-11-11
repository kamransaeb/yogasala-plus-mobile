// Retrofit’s own examples often hide Dio’s Headers so it doesn’t clash with
// Retrofit’s own Headers.
import 'package:dio/dio.dart' hide Headers;
import 'package:enterprise_network/enterprise_network.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:yogasala_plus_mobile/features/categories/data/api/categories_endpoints.dart';
import 'package:yogasala_plus_mobile/features/categories/data/models/category_model.dart';

part 'categories_api_client.g.dart';

/// Categories API client (authenticated mobile user).
@lazySingleton
@RestApi()
abstract class CategoriesApiClient {
  /// Factory method for the implementation.
  @factoryMethod
  factory CategoriesApiClient(DioClient dioClient) =>
      _CategoriesApiClient(dioClient.dio);

  /// Enabled categories.
  @GET(CategoriesEndpoints.categoriesEnabled)
  @Extra({NetworkConstants.forceRefreshExtraKey: true})
  Future<HttpResponse<List<CategoryModel>>> getCategoriesEnabled();
}
