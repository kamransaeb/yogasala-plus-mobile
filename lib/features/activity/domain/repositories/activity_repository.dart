import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:yogasala_plus_mobile/core/enums/activity_type.dart';
import 'package:yogasala_plus_mobile/features/activity/domain/entities/user_activity_day.dart';
import 'package:yogasala_plus_mobile/features/activity/domain/entities/user_activity_streak.dart';

/// User activity calendar repository.
abstract class ActivityRepository {
  /// Marks today (user TZ) for [type]. Idempotent.
  Future<Either<Failure, void>> markActivity(ActivityType type);

  /// Activity days in `[from, to]` (inclusive, `yyyy-MM-dd`).
  Future<Either<Failure, List<UserActivityDay>>> getActivity({
    required String from,
    required String to,
  });

  /// Current practice streak.
  Future<Either<Failure, UserActivityStreak>> getStreak();
}
