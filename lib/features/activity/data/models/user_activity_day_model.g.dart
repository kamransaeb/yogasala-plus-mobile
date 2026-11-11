// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_activity_day_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserActivityDayModel _$UserActivityDayModelFromJson(
  Map<String, dynamic> json,
) => UserActivityDayModel(
  date: json['date'] as String,
  types:
      (json['types'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      [],
);

Map<String, dynamic> _$UserActivityDayModelToJson(
  UserActivityDayModel instance,
) => <String, dynamic>{'date': instance.date, 'types': instance.types};
