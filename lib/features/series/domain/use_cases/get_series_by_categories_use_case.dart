import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/series/domain/entities/serie.dart';
import 'package:yogasala_plus_mobile/features/series/domain/repositories/series_repository.dart';

/// Loads playable series for the given category ids.
@injectable
class GetSeriesByCategoriesUseCase
    extends BaseUseCase<List<Serie>, GetSeriesByCategoriesParams> {
  /// Creates a [GetSeriesByCategoriesUseCase].
  GetSeriesByCategoriesUseCase(this._repository);

  final SeriesRepository _repository;

  @override
  Future<Either<Failure, List<Serie>>> call(
    GetSeriesByCategoriesParams params,
  ) {
    return _repository.getSeriesByCategories(params.categoryIds);
  }
}

/// Params for [GetSeriesByCategoriesUseCase].
class GetSeriesByCategoriesParams extends Equatable {
  /// Creates params.
  const GetSeriesByCategoriesParams({required this.categoryIds});

  /// Category ids to filter by.
  final List<int> categoryIds;

  @override
  List<Object> get props => [categoryIds];
}
