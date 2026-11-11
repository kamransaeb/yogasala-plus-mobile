import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/points/data/api/points_api_client.dart';
import 'package:yogasala_plus_mobile/features/points/data/datasources/points_remote_data_source.dart';
import 'package:yogasala_plus_mobile/features/points/data/models/user_points_balance_model.dart';
import 'package:yogasala_plus_mobile/features/points/data/models/user_points_leaderboard_page_response_model.dart';

/// Implementation of [PointsRemoteDataSource].
@LazySingleton(as: PointsRemoteDataSource)
class PointsRemoteDataSourceImpl implements PointsRemoteDataSource {
  /// Creates a [PointsRemoteDataSourceImpl].
  PointsRemoteDataSourceImpl(this._apiClient);

  final PointsApiClient _apiClient;

  @override
  Future<UserPointsBalanceModel> getUserPoints() async {
    final response = await _apiClient.getUserPoints();
    return response.data;
  }

  @override
  Future<UserPointsLeaderboardPageResponseModel> getLeaderboard({
    required int page,
    required int size,
  }) async {
    final response = await _apiClient.getLeaderboard(page: page, size: size);
    return response.data;
  }
}
