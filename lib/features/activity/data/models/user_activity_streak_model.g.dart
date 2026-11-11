// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_activity_streak_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserActivityStreakModel _$UserActivityStreakModelFromJson(
  Map<String, dynamic> json,
) => UserActivityStreakModel(
  currentStreak: (json['currentStreak'] as num?)?.toInt() ?? 0,
  bestStreak: (json['bestStreak'] as num?)?.toInt() ?? 0,
  lastActivityDate: json['lastActivityDate'] as String?,
);

Map<String, dynamic> _$UserActivityStreakModelToJson(
  UserActivityStreakModel instance,
) => <String, dynamic>{
  'currentStreak': instance.currentStreak,
  'bestStreak': instance.bestStreak,
  'lastActivityDate': instance.lastActivityDate,
};
