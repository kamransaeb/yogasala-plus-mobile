import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/quiz/data/api/quiz_api_client.dart';
import 'package:yogasala_plus_mobile/features/quiz/data/datasources/quiz_remote_data_source.dart';
import 'package:yogasala_plus_mobile/features/quiz/data/models/submit_quiz_answer_request_model.dart';
import 'package:yogasala_plus_mobile/features/quiz/data/models/video_quiz_answer_result_model.dart';
import 'package:yogasala_plus_mobile/features/quiz/data/models/video_quiz_attempt_page_response_model.dart';
import 'package:yogasala_plus_mobile/features/quiz/data/models/video_quiz_model.dart';

/// Implementation of [QuizRemoteDataSource].
@LazySingleton(as: QuizRemoteDataSource)
class QuizRemoteDataSourceImpl implements QuizRemoteDataSource {
  /// Creates a [QuizRemoteDataSourceImpl].
  QuizRemoteDataSourceImpl(this._apiClient);

  final QuizApiClient _apiClient;

  @override
  Future<VideoQuizModel> getVideoQuiz(int videoId) async {
    final response = await _apiClient.getVideoQuiz(videoId: videoId);
    return response.data;
  }

  @override
  Future<VideoQuizAnswerResultModel> submitQuizAnswer({
    required int videoId,
    required int questionId,
    required int answerId,
  }) async {
    final response = await _apiClient.submitQuizAnswer(
      videoId: videoId,
      questionId: questionId,
      body: SubmitQuizAnswerRequestModel(answerId: answerId),
    );
    return response.data;
  }

  @override
  Future<VideoQuizAttemptPageResponseModel> getQuizAttempts({
    int page = 0,
    int size = 20,
  }) async {
    final response = await _apiClient.getQuizAttempts(page: page, size: size);
    return response.data;
  }

  @override
  Future<VideoQuizModel> getQuizAttemptById(int attemptId) async {
    final response = await _apiClient.getQuizAttemptById(attemptId: attemptId);
    return response.data;
  }
}
