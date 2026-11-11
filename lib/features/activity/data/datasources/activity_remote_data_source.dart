import 'package:yogasala_plus_mobile/core/enums/activity_type.dart';
import 'package:yogasala_plus_mobile/features/activity/data/models/user_activity_day_model.dart';
import 'package:yogasala_plus_mobile/features/activity/data/models/user_activity_streak_model.dart';

/// Remote data source for user activity.
abstract class ActivityRemoteDataSource {
  /// Marks today for [type].
  Future<void> markActivity(ActivityType type);

  /// Activity days in range.
  Future<List<UserActivityDayModel>> getActivity({
    required String from,
    required String to,
  });

  /// Current practice streak.
  Future<UserActivityStreakModel> getStreak();
}
