import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/quiz/domain/entities/video_quiz_answer_result.dart';
import 'package:yogasala_plus_mobile/features/quiz/domain/repositories/quiz_repository.dart';

/// Submits one answer for a quiz question.
@injectable
class SubmitQuizAnswerUseCase
    extends BaseUseCase<VideoQuizAnswerResult, SubmitQuizAnswerParams> {
  /// Creates a [SubmitQuizAnswerUseCase].
  SubmitQuizAnswerUseCase(this._repository);

  final QuizRepository _repository;

  @override
  Future<Either<Failure, VideoQuizAnswerResult>> call(
    SubmitQuizAnswerParams params,
  ) {
    return _repository.submitQuizAnswer(
      videoId: params.videoId,
      questionId: params.questionId,
      answerId: params.answerId,
    );
  }
}

/// Params for [SubmitQuizAnswerUseCase].
class SubmitQuizAnswerParams extends Equatable {
  /// Creates params.
  const SubmitQuizAnswerParams({
    required this.videoId,
    required this.questionId,
    required this.answerId,
  });

  /// Video id.
  final int videoId;

  /// Question id.
  final int questionId;

  /// Selected answer id.
  final int answerId;

  @override
  List<Object> get props => [videoId, questionId, answerId];
}
