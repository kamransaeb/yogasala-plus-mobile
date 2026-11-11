import 'package:yogasala_plus_mobile/features/videos/domain/entities/video.dart';

/// One page of videos from a paginated list API.
class VideoPage {
  /// Creates a [VideoPage].
  const VideoPage({
    required this.content,
    required this.page,
    required this.size,
    required this.totalElements,
    required this.totalPages,
  });

  /// Videos on this page.
  final List<Video> content;

  /// Zero-based page index.
  final int page;

  /// Page size.
  final int size;

  /// Total video count across all pages.
  final int totalElements;

  /// Total page count.
  final int totalPages;

  /// Whether another page can be requested.
  bool get hasMore => page + 1 < totalPages;
}
