import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/quiz/data/datasources/quiz_remote_data_source.dart';
import 'package:yogasala_plus_mobile/features/quiz/domain/entities/video_quiz.dart';
import 'package:yogasala_plus_mobile/features/quiz/domain/entities/video_quiz_answer_result.dart';
import 'package:yogasala_plus_mobile/features/quiz/domain/entities/video_quiz_attempt_page.dart';
import 'package:yogasala_plus_mobile/features/quiz/domain/repositories/quiz_repository.dart';

/// Implementation of [QuizRepository].
@LazySingleton(as: QuizRepository)
class QuizRepositoryImpl implements QuizRepository {
  /// Creates a [QuizRepositoryImpl].
  QuizRepositoryImpl(this._remote, this._errorHandler);

  final QuizRemoteDataSource _remote;
  final ErrorHandler _errorHandler;

  @override
  Future<Either<Failure, VideoQuiz>> getVideoQuiz(int videoId) async {
    try {
      final model = await _remote.getVideoQuiz(videoId);
      return Right(model.toEntity());
    } on Object catch (e, stackTrace) {
      return Left(
        _errorHandler.handleError(
          e,
          stackTrace: stackTrace,
          reason: 'getVideoQuiz',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, VideoQuizAnswerResult>> submitQuizAnswer({
    required int videoId,
    required int questionId,
    required int answerId,
  }) async {
    try {
      final model = await _remote.submitQuizAnswer(
        videoId: videoId,
        questionId: questionId,
        answerId: answerId,
      );
      return Right(model.toEntity());
    } on Object catch (e, stackTrace) {
      return Left(
        _errorHandler.handleError(
          e,
          stackTrace: stackTrace,
          reason: 'submitQuizAnswer',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, VideoQuizAttemptPage>> getQuizAttempts({
    int page = 0,
    int size = 20,
  }) async {
    try {
      final response = await _remote.getQuizAttempts(page: page, size: size);
      return Right(
        VideoQuizAttemptPage(
          content: response.content.map((e) => e.toEntity()).toList(),
          page: response.page,
          size: response.size,
          totalElements: response.totalElements,
          totalPages: response.totalPages,
        ),
      );
    } on Object catch (e, stackTrace) {
      return Left(
        _errorHandler.handleError(
          e,
          stackTrace: stackTrace,
          reason: 'getQuizAttempts',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, VideoQuiz>> getQuizAttemptById(int attemptId) async {
    try {
      final model = await _remote.getQuizAttemptById(attemptId);
      return Right(model.toEntity());
    } on Object catch (e, stackTrace) {
      return Left(
        _errorHandler.handleError(
          e,
          stackTrace: stackTrace,
          reason: 'getQuizAttemptById',
        ),
      );
    }
  }
}
