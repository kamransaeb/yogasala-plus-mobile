import 'package:yogasala_plus_mobile/features/teachers/domain/entities/teacher.dart';

/// One page of teachers from the paginated list API.
class TeacherPage {
  /// Creates a [TeacherPage].
  const TeacherPage({
    required this.content,
    required this.page,
    required this.size,
    required this.totalElements,
    required this.totalPages,
  });

  /// Teachers on this page.
  final List<Teacher> content;

  /// Zero-based page index.
  final int page;

  /// Page size.
  final int size;

  /// Total teacher count across all pages.
  final int totalElements;

  /// Total page count.
  final int totalPages;

  /// Whether another page can be requested.
  bool get hasMore => page + 1 < totalPages;
}
