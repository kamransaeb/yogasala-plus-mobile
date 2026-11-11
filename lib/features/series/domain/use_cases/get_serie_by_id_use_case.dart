import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/series/domain/entities/serie.dart';
import 'package:yogasala_plus_mobile/features/series/domain/repositories/series_repository.dart';

/// Loads a single serie by id.
@injectable
class GetSerieByIdUseCase extends BaseUseCase<Serie, GetSerieByIdParams> {
  /// Creates a [GetSerieByIdUseCase].
  GetSerieByIdUseCase(this._repository);

  final SeriesRepository _repository;

  @override
  Future<Either<Failure, Serie>> call(GetSerieByIdParams params) {
    return _repository.getSerieById(params.id);
  }
}

/// Params for [GetSerieByIdUseCase].
class GetSerieByIdParams extends Equatable {
  /// Creates params.
  const GetSerieByIdParams({required this.id});

  /// Serie id.
  final int id;

  @override
  List<Object> get props => [id];
}
