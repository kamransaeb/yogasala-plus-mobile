import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/quiz/domain/entities/video_quiz.dart';
import 'package:yogasala_plus_mobile/features/quiz/domain/repositories/quiz_repository.dart';

/// Loads quiz + progress for a video.
@injectable
class GetVideoQuizUseCase extends BaseUseCase<VideoQuiz, GetVideoQuizParams> {
  /// Creates a [GetVideoQuizUseCase].
  GetVideoQuizUseCase(this._repository);

  final QuizRepository _repository;

  @override
  Future<Either<Failure, VideoQuiz>> call(GetVideoQuizParams params) {
    return _repository.getVideoQuiz(params.videoId);
  }
}

/// Params for [GetVideoQuizUseCase].
class GetVideoQuizParams extends Equatable {
  /// Creates params.
  const GetVideoQuizParams({required this.videoId});

  /// Video id.
  final int videoId;

  @override
  List<Object> get props => [videoId];
}
