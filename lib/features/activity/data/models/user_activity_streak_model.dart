import 'package:json_annotation/json_annotation.dart';
import 'package:yogasala_plus_mobile/core/utils/model_to_entity_mapper.dart';
import 'package:yogasala_plus_mobile/features/activity/domain/entities/user_activity_streak.dart';

part 'user_activity_streak_model.g.dart';

/// Serializable streak payload from `GET /mobile/user/activity/streak`.
@JsonSerializable()
class UserActivityStreakModel
    implements ModelToEntityMapper<UserActivityStreak> {
  /// Creates a [UserActivityStreakModel].
  const UserActivityStreakModel({
    this.currentStreak = 0,
    this.bestStreak = 0,
    this.lastActivityDate,
  });

  /// JSON constructor.
  factory UserActivityStreakModel.fromJson(Map<String, dynamic> json) =>
      _$UserActivityStreakModelFromJson(json);

  /// To JSON.
  Map<String, dynamic> toJson() => _$UserActivityStreakModelToJson(this);

  /// Consecutive active days.
  @JsonKey(defaultValue: 0)
  final int currentStreak;

  /// Longest streak achieved so far.
  @JsonKey(defaultValue: 0)
  final int bestStreak;

  /// Last activity day (`yyyy-MM-dd`), if any.
  final String? lastActivityDate;

  @override
  UserActivityStreak toEntity() {
    DateTime? last;
    final raw = lastActivityDate?.trim();
    if (raw != null && raw.isNotEmpty) {
      final parsed = DateTime.tryParse(raw);
      if (parsed != null) {
        last = DateTime(parsed.year, parsed.month, parsed.day);
      }
    }
    return UserActivityStreak(
      currentStreak: currentStreak,
      bestStreak: bestStreak,
      lastActivityDate: last,
    );
  }
}
