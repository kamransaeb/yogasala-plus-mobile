import 'package:yogasala_plus_mobile/features/points/data/models/user_points_balance_model.dart';
import 'package:yogasala_plus_mobile/features/points/data/models/user_points_leaderboard_page_response_model.dart';

/// Remote data source for points.
abstract class PointsRemoteDataSource {
  /// Current user's points balance.
  Future<UserPointsBalanceModel> getUserPoints();

  /// Paginated points leaderboard.
  Future<UserPointsLeaderboardPageResponseModel> getLeaderboard({
    required int page,
    required int size,
  });
}
