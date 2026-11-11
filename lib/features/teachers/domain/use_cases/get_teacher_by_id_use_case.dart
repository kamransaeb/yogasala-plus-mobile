import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/teachers/domain/entities/teacher.dart';
import 'package:yogasala_plus_mobile/features/teachers/domain/repositories/teachers_repository.dart';

/// Loads a single enabled teacher by id.
@injectable
class GetTeacherByIdUseCase
    extends BaseUseCase<Teacher, GetTeacherByIdParams> {
  /// Creates a [GetTeacherByIdUseCase].
  GetTeacherByIdUseCase(this._repository);

  final TeachersRepository _repository;

  @override
  Future<Either<Failure, Teacher>> call(GetTeacherByIdParams params) {
    return _repository.getTeacherById(params.id);
  }
}

/// Params for [GetTeacherByIdUseCase].
class GetTeacherByIdParams extends Equatable {
  /// Creates params.
  const GetTeacherByIdParams({required this.id});

  /// Teacher id.
  final int id;

  @override
  List<Object> get props => [id];
}
