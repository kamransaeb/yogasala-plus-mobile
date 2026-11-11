import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/series/domain/entities/serie_page.dart';
import 'package:yogasala_plus_mobile/features/series/domain/repositories/series_repository.dart';

/// Loads a page of playable series, optionally filtered by name.
@injectable
class GetSeriesUseCase extends BaseUseCase<SeriePage, GetSeriesParams> {
  /// Creates a [GetSeriesUseCase].
  GetSeriesUseCase(this._repository);

  final SeriesRepository _repository;

  @override
  Future<Either<Failure, SeriePage>> call(GetSeriesParams params) {
    return _repository.getSeries(
      page: params.page,
      size: params.size,
      name: params.name,
    );
  }
}

/// Params for [GetSeriesUseCase].
class GetSeriesParams extends Equatable {
  /// Creates params.
  const GetSeriesParams({
    this.page = 0,
    this.size = 20,
    this.name,
  });

  /// Zero-based page index.
  final int page;

  /// Page size.
  final int size;

  /// Optional name filter (trimmed empty → omitted).
  final String? name;

  @override
  List<Object?> get props => [page, size, name];
}
