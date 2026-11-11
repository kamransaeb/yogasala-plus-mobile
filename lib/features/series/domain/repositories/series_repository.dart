import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:yogasala_plus_mobile/features/series/domain/entities/serie.dart';
import 'package:yogasala_plus_mobile/features/series/domain/entities/serie_page.dart';

/// Repository for series.
abstract class SeriesRepository {
  /// Paginated playable series for one category.
  Future<Either<Failure, SeriePage>> getSeriesByCategory({
    required int categoryId,
    int page = 0,
    int size = 20,
  });

  /// Playable series for [categoryIds].
  Future<Either<Failure, List<Serie>>> getSeriesByCategories(
    List<int> categoryIds,
  );

  /// Paginated playable series (optional [name] filter).
  Future<Either<Failure, SeriePage>> getSeries({
    int page = 0,
    int size = 20,
    String? name,
  });

  /// Single series by id.
  Future<Either<Failure, Serie>> getSerieById(int id);
}
