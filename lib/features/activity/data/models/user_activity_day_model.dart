import 'package:json_annotation/json_annotation.dart';
import 'package:yogasala_plus_mobile/core/enums/activity_type.dart';
import 'package:yogasala_plus_mobile/core/utils/model_to_entity_mapper.dart';
import 'package:yogasala_plus_mobile/features/activity/domain/entities/user_activity_day.dart';

part 'user_activity_day_model.g.dart';

/// Serializable activity day from `GET /mobile/user/activity`.
@JsonSerializable()
class UserActivityDayModel implements ModelToEntityMapper<UserActivityDay> {
  /// Creates a [UserActivityDayModel].
  const UserActivityDayModel({
    required this.date,
    this.types = const [],
  });

  /// JSON constructor.
  factory UserActivityDayModel.fromJson(Map<String, dynamic> json) =>
      _$UserActivityDayModelFromJson(json);

  /// To JSON.
  Map<String, dynamic> toJson() => _$UserActivityDayModelToJson(this);

  /// Calendar day (`yyyy-MM-dd`).
  final String date;

  /// Wire activity types for this day.
  @JsonKey(defaultValue: <int>[])
  final List<int> types;

  @override
  UserActivityDay toEntity() {
    final parsed = DateTime.parse(date);
    final day = DateTime(parsed.year, parsed.month, parsed.day);
    final activityTypes = types
        .map(ActivityType.fromWire)
        .whereType<ActivityType>()
        .toList(growable: false);
    return UserActivityDay(date: day, types: activityTypes);
  }
}
