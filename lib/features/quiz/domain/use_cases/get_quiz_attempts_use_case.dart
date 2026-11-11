import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/quiz/domain/entities/video_quiz_attempt_page.dart';
import 'package:yogasala_plus_mobile/features/quiz/domain/repositories/quiz_repository.dart';

/// Loads a page of completed quiz attempts.
@injectable
class GetQuizAttemptsUseCase
    extends BaseUseCase<VideoQuizAttemptPage, GetQuizAttemptsParams> {
  /// Creates a [GetQuizAttemptsUseCase].
  GetQuizAttemptsUseCase(this._repository);

  final QuizRepository _repository;

  @override
  Future<Either<Failure, VideoQuizAttemptPage>> call(
    GetQuizAttemptsParams params,
  ) {
    return _repository.getQuizAttempts(
      page: params.page,
      size: params.size,
    );
  }
}

/// Params for [GetQuizAttemptsUseCase].
class GetQuizAttemptsParams extends Equatable {
  /// Creates params.
  const GetQuizAttemptsParams({
    this.page = 0,
    this.size = 20,
  });

  /// Zero-based page index.
  final int page;

  /// Page size.
  final int size;

  @override
  List<Object> get props => [page, size];
}
