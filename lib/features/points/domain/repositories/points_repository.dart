import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:yogasala_plus_mobile/features/points/domain/entities/user_points_balance.dart';
import 'package:yogasala_plus_mobile/features/points/domain/entities/user_points_leaderboard_page.dart';

/// Repository for user points.
abstract class PointsRepository {
  /// Current user's points balance.
  Future<Either<Failure, UserPointsBalance>> getUserPoints();

  /// Paginated points leaderboard.
  Future<Either<Failure, UserPointsLeaderboardPage>> getLeaderboard({
    required int page,
    required int size,
  });
}
