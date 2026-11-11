import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/series/domain/entities/serie_page.dart';
import 'package:yogasala_plus_mobile/features/series/domain/repositories/series_repository.dart';

/// Loads a page of playable series for one category.
@injectable
class GetSeriesByCategoryUseCase
    extends BaseUseCase<SeriePage, GetSeriesByCategoryParams> {
  /// Creates a [GetSeriesByCategoryUseCase].
  GetSeriesByCategoryUseCase(this._repository);

  final SeriesRepository _repository;

  @override
  Future<Either<Failure, SeriePage>> call(
    GetSeriesByCategoryParams params,
  ) {
    return _repository.getSeriesByCategory(
      categoryId: params.categoryId,
      page: params.page,
      size: params.size,
    );
  }
}

/// Params for [GetSeriesByCategoryUseCase].
class GetSeriesByCategoryParams extends Equatable {
  /// Creates params.
  const GetSeriesByCategoryParams({
    required this.categoryId,
    this.page = 0,
    this.size = 20,
  });

  /// Category id.
  final int categoryId;

  /// Zero-based page index.
  final int page;

  /// Page size.
  final int size;

  @override
  List<Object> get props => [categoryId, page, size];
}
