import 'package:yogasala_plus_mobile/features/series/data/models/serie_page_response_model.dart';
import 'package:yogasala_plus_mobile/features/teachers/data/models/teacher_model.dart';
import 'package:yogasala_plus_mobile/features/teachers/data/models/teacher_page_response_model.dart';

/// Remote data source for teachers.
abstract class TeachersRemoteDataSource {
  /// Paginated enabled teachers.
  Future<TeacherPageResponseModel> getTeachers({
    int page = 0,
    int size = 20,
  });

  /// Single enabled teacher by id.
  Future<TeacherModel> getTeacherById(int id);

  /// Paginated enabled series for a teacher.
  Future<SeriePageResponseModel> getTeacherSeries({
    required int id,
    int page = 0,
    int size = 20,
  });
}
