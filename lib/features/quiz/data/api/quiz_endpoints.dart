/// Video quiz API path constants (mobile user).
abstract final class QuizEndpoints {
  /// Quiz + progress for one video.
  static const String videoQuiz = '/mobile/user/videos/{videoId}/quiz';

  /// Submit one answer for a question.
  static const String submitAnswer =
      '/mobile/user/videos/{videoId}/quiz/questions/{questionId}/answer';

  /// Paginated completed quiz attempts (newest first).
  static const String quizAttempts = '/mobile/user/quiz-attempts';

  /// Completed attempt detail (exact version answered).
  static const String quizAttemptById = '/mobile/user/quiz-attempts/{attemptId}';
}
