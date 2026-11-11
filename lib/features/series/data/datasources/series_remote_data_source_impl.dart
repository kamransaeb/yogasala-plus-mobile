import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/series/data/api/series_api_client.dart';
import 'package:yogasala_plus_mobile/features/series/data/datasources/series_remote_data_source.dart';
import 'package:yogasala_plus_mobile/features/series/data/models/serie_model.dart';
import 'package:yogasala_plus_mobile/features/series/data/models/serie_page_response_model.dart';

/// Implementation of [SeriesRemoteDataSource].
@LazySingleton(as: SeriesRemoteDataSource)
class SeriesRemoteDataSourceImpl implements SeriesRemoteDataSource {
  /// Creates a [SeriesRemoteDataSourceImpl].
  SeriesRemoteDataSourceImpl(this._apiClient);

  final SeriesApiClient _apiClient;

  @override
  Future<SeriePageResponseModel> getSeriesByCategory({
    required int categoryId,
    int page = 0,
    int size = 20,
  }) async {
    final response = await _apiClient.getSeriesByCategory(
      categoryId: categoryId,
      page: page,
      size: size,
    );
    return response.data;
  }

  @override
  Future<List<SerieModel>> getSeriesByCategories(
    List<int> categoryIds,
  ) async {
    final response = await _apiClient.getSeriesByCategories(
      categoryIds: categoryIds,
    );
    return response.data;
  }

  @override
  Future<SeriePageResponseModel> getSeries({
    int page = 0,
    int size = 20,
    String? name,
  }) async {
    final response = await _apiClient.getSeries(
      page: page,
      size: size,
      name: name,
    );
    return response.data;
  }

  @override
  Future<SerieModel> getSerieById(int id) async {
    final response = await _apiClient.getSerieById(id: id);
    return response.data;
  }
}
