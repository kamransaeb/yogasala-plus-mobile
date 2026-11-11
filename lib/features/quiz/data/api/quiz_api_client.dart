// Retrofit’s own examples often hide Dio’s Headers so it doesn’t clash with
// Retrofit’s own Headers.
import 'package:dio/dio.dart' hide Headers;
import 'package:enterprise_network/enterprise_network.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:yogasala_plus_mobile/features/quiz/data/api/quiz_endpoints.dart';
import 'package:yogasala_plus_mobile/features/quiz/data/models/submit_quiz_answer_request_model.dart';
import 'package:yogasala_plus_mobile/features/quiz/data/models/video_quiz_answer_result_model.dart';
import 'package:yogasala_plus_mobile/features/quiz/data/models/video_quiz_attempt_page_response_model.dart';
import 'package:yogasala_plus_mobile/features/quiz/data/models/video_quiz_model.dart';

part 'quiz_api_client.g.dart';

/// Video quiz API client (authenticated mobile user).
@lazySingleton
@RestApi()
abstract class QuizApiClient {
  /// Factory method for the implementation.
  @factoryMethod
  factory QuizApiClient(DioClient dioClient) => _QuizApiClient(dioClient.dio);

  /// Quiz + progress for [videoId].
  @GET(QuizEndpoints.videoQuiz)
  @Extra({NetworkConstants.forceRefreshExtraKey: true})
  Future<HttpResponse<VideoQuizModel>> getVideoQuiz({
    @Path('videoId') required int videoId,
  });

  /// Submit one answer for [questionId] on [videoId].
  @PUT(QuizEndpoints.submitAnswer)
  @Extra({NetworkConstants.forceRefreshExtraKey: true})
  Future<HttpResponse<VideoQuizAnswerResultModel>> submitQuizAnswer({
    @Path('videoId') required int videoId,
    @Path('questionId') required int questionId,
    @Body() required SubmitQuizAnswerRequestModel body,
  });

  /// Paginated completed quiz attempts.
  @GET(QuizEndpoints.quizAttempts)
  @Extra({NetworkConstants.forceRefreshExtraKey: true})
  Future<HttpResponse<VideoQuizAttemptPageResponseModel>> getQuizAttempts({
    @Query('page') int page = 0,
    @Query('size') int size = 20,
  });

  /// Completed attempt detail by [attemptId].
  @GET(QuizEndpoints.quizAttemptById)
  @Extra({NetworkConstants.forceRefreshExtraKey: true})
  Future<HttpResponse<VideoQuizModel>> getQuizAttemptById({
    @Path('attemptId') required int attemptId,
  });
}
