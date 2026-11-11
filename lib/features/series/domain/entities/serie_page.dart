import 'package:yogasala_plus_mobile/features/series/domain/entities/serie.dart';

/// One page of playable series from the paginated list API.
class SeriePage {
  /// Creates a [SeriePage].
  const SeriePage({
    required this.content,
    required this.page,
    required this.size,
    required this.totalElements,
    required this.totalPages,
  });

  /// Series on this page.
  final List<Serie> content;

  /// Zero-based page index.
  final int page;

  /// Page size.
  final int size;

  /// Total series count across all pages.
  final int totalElements;

  /// Total page count.
  final int totalPages;

  /// Whether another page can be requested.
  bool get hasMore => page + 1 < totalPages;
}
