// Retrofit’s own examples often hide Dio’s Headers so it doesn’t clash with
// Retrofit’s own Headers.
import 'package:dio/dio.dart' hide Headers;
import 'package:enterprise_network/enterprise_network.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:yogasala_plus_mobile/features/activity/data/api/activity_endpoints.dart';
import 'package:yogasala_plus_mobile/features/activity/data/models/mark_activity_request_model.dart';
import 'package:yogasala_plus_mobile/features/activity/data/models/user_activity_day_model.dart';
import 'package:yogasala_plus_mobile/features/activity/data/models/user_activity_streak_model.dart';

part 'activity_api_client.g.dart';

/// User activity API client (authenticated mobile user).
@lazySingleton
@RestApi()
abstract class ActivityApiClient {
  /// Factory method for the implementation.
  @factoryMethod
  factory ActivityApiClient(DioClient dioClient) =>
      _ActivityApiClient(dioClient.dio);

  /// Mark today for the body's activity type in the user's stored TZ.
  @POST(ActivityEndpoints.activity)
  @Extra({NetworkConstants.forceRefreshExtraKey: true})
  Future<HttpResponse<void>> markActivity({
    @Body() required MarkActivityRequestModel body,
  });

  /// Activity days in `[from, to]` (`yyyy-MM-dd`, inclusive).
  @GET(ActivityEndpoints.activity)
  @Extra({NetworkConstants.forceRefreshExtraKey: true})
  Future<HttpResponse<List<UserActivityDayModel>>> getActivity({
    @Query('from') required String from,
    @Query('to') required String to,
  });

  /// Current practice streak for the authenticated user.
  @GET(ActivityEndpoints.streak)
  @Extra({NetworkConstants.forceRefreshExtraKey: true})
  Future<HttpResponse<UserActivityStreakModel>> getStreak();
}
