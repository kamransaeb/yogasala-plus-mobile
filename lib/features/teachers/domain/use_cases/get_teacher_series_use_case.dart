import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/series/domain/entities/serie_page.dart';
import 'package:yogasala_plus_mobile/features/teachers/domain/repositories/teachers_repository.dart';

/// Loads a page of enabled series for a teacher.
@injectable
class GetTeacherSeriesUseCase
    extends BaseUseCase<SeriePage, GetTeacherSeriesParams> {
  /// Creates a [GetTeacherSeriesUseCase].
  GetTeacherSeriesUseCase(this._repository);

  final TeachersRepository _repository;

  @override
  Future<Either<Failure, SeriePage>> call(GetTeacherSeriesParams params) {
    return _repository.getTeacherSeries(
      id: params.id,
      page: params.page,
      size: params.size,
    );
  }
}

/// Params for [GetTeacherSeriesUseCase].
class GetTeacherSeriesParams extends Equatable {
  /// Creates params.
  const GetTeacherSeriesParams({
    required this.id,
    this.page = 0,
    this.size = 20,
  });

  /// Teacher id.
  final int id;

  /// Zero-based page index.
  final int page;

  /// Page size.
  final int size;

  @override
  List<Object> get props => [id, page, size];
}
