// Retrofit’s own examples often hide Dio’s Headers so it doesn’t clash with
// Retrofit’s own Headers.
import 'package:dio/dio.dart' hide Headers;
import 'package:enterprise_network/enterprise_network.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:yogasala_plus_mobile/features/points/data/api/points_endpoints.dart';
import 'package:yogasala_plus_mobile/features/points/data/models/user_points_balance_model.dart';
import 'package:yogasala_plus_mobile/features/points/data/models/user_points_leaderboard_page_response_model.dart';

part 'points_api_client.g.dart';

/// Points API client (authenticated mobile user).
@lazySingleton
@RestApi()
abstract class PointsApiClient {
  /// Factory method for the implementation.
  @factoryMethod
  factory PointsApiClient(DioClient dioClient) =>
      _PointsApiClient(dioClient.dio);

  /// Current user's points balance.
  @GET(PointsEndpoints.points)
  @Extra({NetworkConstants.forceRefreshExtraKey: true})
  Future<HttpResponse<UserPointsBalanceModel>> getUserPoints();

  /// Paginated points leaderboard.
  @GET(PointsEndpoints.leaderboard)
  @Extra({NetworkConstants.forceRefreshExtraKey: true})
  Future<HttpResponse<UserPointsLeaderboardPageResponseModel>> getLeaderboard({
    @Query('page') int page = 0,
    @Query('size') int size = 20,
  });
}
