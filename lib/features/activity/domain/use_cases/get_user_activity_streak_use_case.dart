import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/activity/domain/entities/user_activity_streak.dart';
import 'package:yogasala_plus_mobile/features/activity/domain/repositories/activity_repository.dart';

/// Loads the user's current activity streak.
@injectable
class GetUserActivityStreakUseCase
    extends BaseUseCase<UserActivityStreak, NoParams> {
  /// Creates a [GetUserActivityStreakUseCase].
  GetUserActivityStreakUseCase(this._repository);

  final ActivityRepository _repository;

  @override
  Future<Either<Failure, UserActivityStreak>> call(NoParams params) {
    return _repository.getStreak();
  }
}
