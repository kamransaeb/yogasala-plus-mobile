import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/quiz/domain/entities/video_quiz.dart';
import 'package:yogasala_plus_mobile/features/quiz/domain/repositories/quiz_repository.dart';

/// Loads a completed quiz attempt detail (exact version answered).
@injectable
class GetQuizAttemptByIdUseCase
    extends BaseUseCase<VideoQuiz, GetQuizAttemptByIdParams> {
  /// Creates a [GetQuizAttemptByIdUseCase].
  GetQuizAttemptByIdUseCase(this._repository);

  final QuizRepository _repository;

  @override
  Future<Either<Failure, VideoQuiz>> call(GetQuizAttemptByIdParams params) {
    return _repository.getQuizAttemptById(params.attemptId);
  }
}

/// Params for [GetQuizAttemptByIdUseCase].
class GetQuizAttemptByIdParams extends Equatable {
  /// Creates params.
  const GetQuizAttemptByIdParams({required this.attemptId});

  /// Attempt id.
  final int attemptId;

  @override
  List<Object> get props => [attemptId];
}
