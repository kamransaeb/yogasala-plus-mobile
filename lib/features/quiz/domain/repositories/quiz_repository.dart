import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:yogasala_plus_mobile/features/quiz/domain/entities/video_quiz.dart';
import 'package:yogasala_plus_mobile/features/quiz/domain/entities/video_quiz_answer_result.dart';
import 'package:yogasala_plus_mobile/features/quiz/domain/entities/video_quiz_attempt_page.dart';

/// Repository for video quizzes.
abstract class QuizRepository {
  /// Quiz + progress for [videoId].
  Future<Either<Failure, VideoQuiz>> getVideoQuiz(int videoId);

  /// Submit one answer for [questionId] on [videoId].
  Future<Either<Failure, VideoQuizAnswerResult>> submitQuizAnswer({
    required int videoId,
    required int questionId,
    required int answerId,
  });

  /// Paginated completed quiz attempts.
  Future<Either<Failure, VideoQuizAttemptPage>> getQuizAttempts({
    int page = 0,
    int size = 20,
  });

  /// Completed attempt detail by [attemptId].
  Future<Either<Failure, VideoQuiz>> getQuizAttemptById(int attemptId);
}
