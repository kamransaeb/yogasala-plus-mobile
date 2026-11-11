import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/points/domain/entities/user_points_balance.dart';
import 'package:yogasala_plus_mobile/features/points/domain/repositories/points_repository.dart';

/// Loads the current user's points balance.
@injectable
class GetUserPointsUseCase extends BaseUseCase<UserPointsBalance, NoParams> {
  /// Creates a [GetUserPointsUseCase].
  GetUserPointsUseCase(this._repository);

  final PointsRepository _repository;

  @override
  Future<Either<Failure, UserPointsBalance>> call(NoParams params) {
    return _repository.getUserPoints();
  }
}
