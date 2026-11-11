// Retrofit’s own examples often hide Dio’s Headers so it doesn’t clash with
// Retrofit’s own Headers.
import 'package:dio/dio.dart' hide Headers;
import 'package:enterprise_network/enterprise_network.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:yogasala_plus_mobile/features/series/data/api/series_endpoints.dart';
import 'package:yogasala_plus_mobile/features/series/data/models/serie_model.dart';
import 'package:yogasala_plus_mobile/features/series/data/models/serie_page_response_model.dart';

part 'series_api_client.g.dart';

/// Serie API client (authenticated mobile user).
@lazySingleton
@RestApi()
abstract class SeriesApiClient {
  /// Factory method for the implementation.
  @factoryMethod
  factory SeriesApiClient(DioClient dioClient) =>
      _SeriesApiClient(dioClient.dio);

  /// Paginated playable series for one category.
  @GET(SeriesEndpoints.seriesByCategory)
  @Extra({NetworkConstants.forceRefreshExtraKey: true})
  Future<HttpResponse<SeriePageResponseModel>> getSeriesByCategory({
    @Path('categoryId') required int categoryId,
    @Query('page') int page = 0,
    @Query('size') int size = 20,
  });

  /// Playable series for the given category ids.
  @GET(SeriesEndpoints.seriesByCategories)
  @Extra({NetworkConstants.forceRefreshExtraKey: true})
  Future<HttpResponse<List<SerieModel>>> getSeriesByCategories({
    @Query('categoryIds') required List<int> categoryIds,
  });

  /// Paginated playable series (optional name filter).
  @GET(SeriesEndpoints.series)
  @Extra({NetworkConstants.forceRefreshExtraKey: true})
  Future<HttpResponse<SeriePageResponseModel>> getSeries({
    @Query('page') int page = 0,
    @Query('size') int size = 20,
    @Query('name') String? name,
  });

  /// Single series by id.
  @GET(SeriesEndpoints.serieById)
  @Extra({NetworkConstants.forceRefreshExtraKey: true})
  Future<HttpResponse<SerieModel>> getSerieById({
    @Path('id') required int id,
  });
}
