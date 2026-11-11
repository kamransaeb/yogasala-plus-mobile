import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:yogasala_plus_mobile/features/series/domain/entities/serie_page.dart';
import 'package:yogasala_plus_mobile/features/teachers/domain/entities/teacher.dart';
import 'package:yogasala_plus_mobile/features/teachers/domain/entities/teacher_page.dart';

/// Repository for teachers.
abstract class TeachersRepository {
  /// Paginated enabled teachers.
  Future<Either<Failure, TeacherPage>> getTeachers({
    int page = 0,
    int size = 20,
  });

  /// Single enabled teacher by id.
  Future<Either<Failure, Teacher>> getTeacherById(int id);

  /// Paginated enabled series for a teacher.
  Future<Either<Failure, SeriePage>> getTeacherSeries({
    required int id,
    int page = 0,
    int size = 20,
  });
}
