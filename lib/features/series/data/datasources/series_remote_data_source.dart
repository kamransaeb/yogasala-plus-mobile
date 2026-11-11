import 'package:yogasala_plus_mobile/features/series/data/models/serie_model.dart';
import 'package:yogasala_plus_mobile/features/series/data/models/serie_page_response_model.dart';

/// Remote data source for series.
abstract class SeriesRemoteDataSource {
  /// Paginated playable series for one category.
  Future<SeriePageResponseModel> getSeriesByCategory({
    required int categoryId,
    int page = 0,
    int size = 20,
  });

  /// Playable series for [categoryIds].
  Future<List<SerieModel>> getSeriesByCategories(List<int> categoryIds);

  /// Paginated playable series (optional [name] filter).
  Future<SeriePageResponseModel> getSeries({
    int page = 0,
    int size = 20,
    String? name,
  });

  /// Single series by id.
  Future<SerieModel> getSerieById(int id);
}
