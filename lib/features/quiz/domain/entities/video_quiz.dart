import 'package:yogasala_plus_mobile/core/enums/quiz_status.dart';
import 'package:yogasala_plus_mobile/features/quiz/domain/entities/video_quiz_question.dart';

/// Video quiz with progress for the current user (pinned to a version).
class VideoQuiz {
  /// Creates a [VideoQuiz].
  const VideoQuiz({
    required this.videoId,
    required this.status,
    required this.answeredCount,
    required this.totalCount,
    required this.correctCount,
    required this.questions,
    this.id,
    this.versionId,
    this.versionNumber,
    this.attemptId,
  });

  /// Server quiz id (missing when the video has no quiz).
  final int? id;

  /// Parent video id.
  final int videoId;

  /// Published version id for this attempt / current quiz.
  final int? versionId;

  /// Human-readable version number.
  final int? versionNumber;

  /// Attempt id when [IN_PROGRESS] or [COMPLETED].
  final int? attemptId;

  /// Progress status (`0` / `1` / `2`).
  final QuizStatus status;

  /// How many questions the user has answered.
  final int answeredCount;

  /// Total questions in this version.
  final int totalCount;

  /// How many answers were correct.
  final int correctCount;

  /// Questions sorted by [VideoQuizQuestion.sortOrder].
  final List<VideoQuizQuestion> questions;

  /// Whether this quiz has content to show.
  bool get hasQuestions => totalCount > 0 && questions.isNotEmpty;

  /// Whether the quiz is finished (results only).
  bool get isCompleted => status == QuizStatus.completed;

  /// Index of the first unanswered question, or `-1` if none.
  int get firstUnansweredIndex =>
      questions.indexWhere((q) => !q.isAnswered);

  /// Copy with optional overrides.
  VideoQuiz copyWith({
    int? id,
    int? videoId,
    int? versionId,
    int? versionNumber,
    int? attemptId,
    QuizStatus? status,
    int? answeredCount,
    int? totalCount,
    int? correctCount,
    List<VideoQuizQuestion>? questions,
  }) {
    return VideoQuiz(
      id: id ?? this.id,
      videoId: videoId ?? this.videoId,
      versionId: versionId ?? this.versionId,
      versionNumber: versionNumber ?? this.versionNumber,
      attemptId: attemptId ?? this.attemptId,
      status: status ?? this.status,
      answeredCount: answeredCount ?? this.answeredCount,
      totalCount: totalCount ?? this.totalCount,
      correctCount: correctCount ?? this.correctCount,
      questions: questions ?? this.questions,
    );
  }
}
