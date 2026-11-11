import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/points/domain/entities/user_points_leaderboard_page.dart';
import 'package:yogasala_plus_mobile/features/points/domain/repositories/points_repository.dart';

/// Loads a page of the points leaderboard.
@injectable
class GetLeaderboardUseCase
    extends BaseUseCase<UserPointsLeaderboardPage, GetLeaderboardParams> {
  /// Creates a [GetLeaderboardUseCase].
  GetLeaderboardUseCase(this._repository);

  final PointsRepository _repository;

  @override
  Future<Either<Failure, UserPointsLeaderboardPage>> call(
    GetLeaderboardParams params,
  ) {
    return _repository.getLeaderboard(
      page: params.page,
      size: params.size,
    );
  }
}

/// Params for [GetLeaderboardUseCase].
class GetLeaderboardParams extends Equatable {
  /// Creates params.
  const GetLeaderboardParams({
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
