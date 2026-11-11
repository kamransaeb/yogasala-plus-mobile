/// One completed quiz attempt in the profile list.
class VideoQuizAttemptSummary {
  /// Creates a [VideoQuizAttemptSummary].
  const VideoQuizAttemptSummary({
    required this.attemptId,
    required this.quizId,
    required this.videoId,
    required this.versionId,
    required this.versionNumber,
    required this.correctCount,
    required this.totalCount,
    required this.completedAt,
    this.videoNameEn,
    this.videoNameTr,
    this.videoImageUrl,
  });

  /// Attempt id.
  final int attemptId;

  /// Quiz id.
  final int quizId;

  /// Video id.
  final int videoId;

  /// Version id answered.
  final int versionId;

  /// Version number answered.
  final int versionNumber;

  /// Video name (EN).
  final String? videoNameEn;

  /// Video name (TR).
  final String? videoNameTr;

  /// Video cover / thumbnail URL.
  final String? videoImageUrl;

  /// Correct answers on this attempt.
  final int correctCount;

  /// Total questions on this attempt.
  final int totalCount;

  /// When the attempt was completed (ISO-8601 from API).
  final DateTime completedAt;

  /// Localized video name for [locale] (`tr` / `en`).
  String videoNameForLocale(String locale) {
    if (locale == 'tr') {
      final tr = videoNameTr?.trim() ?? '';
      if (tr.isNotEmpty) return tr;
    }
    final en = videoNameEn?.trim() ?? '';
    if (en.isNotEmpty) return en;
    return videoNameTr?.trim() ?? '';
  }
}
