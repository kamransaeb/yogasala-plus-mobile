import 'package:dio/dio.dart' hide Headers;
import 'package:enterprise_network/enterprise_network.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:yogasala_plus_mobile/features/live_sessions/data/api/live_sessions_endpoints.dart';
import 'package:yogasala_plus_mobile/features/live_sessions/data/models/live_join_model.dart';
import 'package:yogasala_plus_mobile/features/live_sessions/data/models/live_session_model.dart';

part 'live_sessions_api_client.g.dart';

/// Live sessions API client (authenticated mobile user).
@lazySingleton
@RestApi()
abstract class LiveSessionsApiClient {
  /// Factory method for the implementation.
  @factoryMethod
  factory LiveSessionsApiClient(DioClient dioClient) =>
      _LiveSessionsApiClient(dioClient.dio);

  /// Upcoming live session occurrences.
  @GET(LiveSessionsEndpoints.liveSessions)
  @Extra({NetworkConstants.forceRefreshExtraKey: true})
  Future<HttpResponse<List<LiveSessionModel>>> getLiveSessions({
    @Query('days') int days = 7,
  });

  /// Join a live occurrence (requires LIVE entitlement).
  @POST(LiveSessionsEndpoints.join)
  @Extra({NetworkConstants.forceRefreshExtraKey: true})
  Future<HttpResponse<LiveJoinModel>> joinLiveSession({
    @Path('slotId') required int slotId,
    @Query('occurrenceStart') required String occurrenceStart,
  });
}
