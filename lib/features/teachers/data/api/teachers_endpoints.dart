/// Teacher API path constants (mobile user).
abstract final class TeachersEndpoints {
  /// Paginated enabled teachers.
  static const String teachers = '/mobile/user/teachers';

  /// Single teacher by id.
  static const String teacherById = '/mobile/user/teachers/{id}';

  /// Paginated enabled series for a teacher.
  static const String teacherSeries = '/mobile/user/teachers/{id}/series';
}
