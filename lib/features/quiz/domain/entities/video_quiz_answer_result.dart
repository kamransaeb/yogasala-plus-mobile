import 'package:yogasala_plus_mobile/core/enums/quiz_status.dart';

/// Result of submitting one quiz answer.
class VideoQuizAnswerResult {
  /// Creates a [VideoQuizAnswerResult].
  const VideoQuizAnswerResult({
    required this.quizId,
    required this.videoId,
    required this.versionId,
    required this.versionNumber,
    required this.attemptId,
    required this.questionId,
    required this.selectedAnswerId,
    required this.correctAnswerId,
    required this.correct,
    required this.status,
    required this.answeredCount,
    required this.totalCount,
    required this.correctCount,
    this.pointsAwarded,
    this.pointsBalance,
  });

  /// Quiz id.
  final int quizId;

  /// Video id.
  final int videoId;

  /// Version id for this attempt.
  final int versionId;

  /// Version number for this attempt.
  final int versionNumber;

  /// Attempt id.
  final int attemptId;

  /// Question that was answered.
  final int questionId;

  /// Answer the user selected.
  final int selectedAnswerId;

  /// Correct answer id (now revealed).
  final int correctAnswerId;

  /// Whether [selectedAnswerId] matches [correctAnswerId].
  final bool correct;

  /// Updated quiz status (`0` / `1` / `2`).
  final QuizStatus status;

  /// Updated answered count.
  final int answeredCount;

  /// Total questions.
  final int totalCount;

  /// Updated correct count.
  final int correctCount;

  /// Points awarded when this submit first completed the quiz.
  final int? pointsAwarded;

  /// User points balance after this submit (when quiz completed).
  final int? pointsBalance;
}
