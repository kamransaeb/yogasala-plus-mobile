import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/teachers/domain/entities/teacher_page.dart';
import 'package:yogasala_plus_mobile/features/teachers/domain/repositories/teachers_repository.dart';

/// Loads a page of enabled teachers.
@injectable
class GetTeachersUseCase extends BaseUseCase<TeacherPage, GetTeachersParams> {
  /// Creates a [GetTeachersUseCase].
  GetTeachersUseCase(this._repository);

  final TeachersRepository _repository;

  @override
  Future<Either<Failure, TeacherPage>> call(GetTeachersParams params) {
    return _repository.getTeachers(
      page: params.page,
      size: params.size,
    );
  }
}

/// Params for [GetTeachersUseCase].
class GetTeachersParams extends Equatable {
  /// Creates params.
  const GetTeachersParams({
    this.page = 0,
    this.size = 20,
  });

  /// Zero-based page index.
  final int page;

  /// Page size.
  final int size;

  @override
  List<Object> get props => [page, size];
}
