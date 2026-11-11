import 'package:yogasala_plus_mobile/features/quiz/data/models/video_quiz_answer_result_model.dart';
import 'package:yogasala_plus_mobile/features/quiz/data/models/video_quiz_attempt_page_response_model.dart';
import 'package:yogasala_plus_mobile/features/quiz/data/models/video_quiz_model.dart';

/// Remote data source for video quizzes.
abstract class QuizRemoteDataSource {
  /// Quiz + progress for [videoId].
  Future<VideoQuizModel> getVideoQuiz(int videoId);

  /// Submit one answer for [questionId] on [videoId].
  Future<VideoQuizAnswerResultModel> submitQuizAnswer({
    required int videoId,
    required int questionId,
    required int answerId,
  });

  /// Paginated completed quiz attempts.
  Future<VideoQuizAttemptPageResponseModel> getQuizAttempts({
    int page = 0,
    int size = 20,
  });

  /// Completed attempt detail by [attemptId].
  Future<VideoQuizModel> getQuizAttemptById(int attemptId);
}
