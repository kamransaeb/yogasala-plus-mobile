import 'package:yogasala_plus_mobile/features/quiz/domain/entities/video_quiz_attempt_summary.dart';

/// One page of completed quiz attempts.
class VideoQuizAttemptPage {
  /// Creates a [VideoQuizAttemptPage].
  const VideoQuizAttemptPage({
    required this.content,
    required this.page,
    required this.size,
    required this.totalElements,
    required this.totalPages,
  });

  /// Attempts on this page.
  final List<VideoQuizAttemptSummary> content;

  /// Zero-based page index.
  final int page;

  /// Page size.
  final int size;

  /// Total attempt count across all pages.
  final int totalElements;

  /// Total page count.
  final int totalPages;

  /// Whether another page can be requested.
  bool get hasMore => page + 1 < totalPages;
}
