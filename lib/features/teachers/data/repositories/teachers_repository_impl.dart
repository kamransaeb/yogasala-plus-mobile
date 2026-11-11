import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/series/domain/entities/serie_page.dart';
import 'package:yogasala_plus_mobile/features/teachers/data/datasources/teachers_remote_data_source.dart';
import 'package:yogasala_plus_mobile/features/teachers/domain/entities/teacher.dart';
import 'package:yogasala_plus_mobile/features/teachers/domain/entities/teacher_page.dart';
import 'package:yogasala_plus_mobile/features/teachers/domain/repositories/teachers_repository.dart';

/// Implementation of [TeachersRepository].
@LazySingleton(as: TeachersRepository)
class TeachersRepositoryImpl implements TeachersRepository {
  /// Creates a [TeachersRepositoryImpl].
  TeachersRepositoryImpl(this._remote, this._errorHandler);

  final TeachersRemoteDataSource _remote;
  final ErrorHandler _errorHandler;

  @override
  Future<Either<Failure, TeacherPage>> getTeachers({
    int page = 0,
    int size = 20,
  }) async {
    try {
      final response = await _remote.getTeachers(page: page, size: size);
      return Right(
        TeacherPage(
          content: response.content.map((e) => e.toEntity()).toList(),
          page: response.page,
          size: response.size,
          totalElements: response.totalElements,
          totalPages: response.totalPages,
        ),
      );
    } on Object catch (e, stackTrace) {
      return Left(
        _errorHandler.handleError(
          e,
          stackTrace: stackTrace,
          reason: 'getTeachers',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Teacher>> getTeacherById(int id) async {
    try {
      final model = await _remote.getTeacherById(id);
      return Right(model.toEntity());
    } on Object catch (e, stackTrace) {
      return Left(
        _errorHandler.handleError(
          e,
          stackTrace: stackTrace,
          reason: 'getTeacherById',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, SeriePage>> getTeacherSeries({
    required int id,
    int page = 0,
    int size = 20,
  }) async {
    try {
      final response = await _remote.getTeacherSeries(
        id: id,
        page: page,
        size: size,
      );
      return Right(
        SeriePage(
          content: response.content.map((e) => e.toEntity()).toList(),
          page: response.page,
          size: response.size,
          totalElements: response.totalElements,
          totalPages: response.totalPages,
        ),
      );
    } on Object catch (e, stackTrace) {
      return Left(
        _errorHandler.handleError(
          e,
          stackTrace: stackTrace,
          reason: 'getTeacherSeries',
        ),
      );
    }
  }
}
