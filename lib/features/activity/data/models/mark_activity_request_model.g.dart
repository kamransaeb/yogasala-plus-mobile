// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mark_activity_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarkActivityRequestModel _$MarkActivityRequestModelFromJson(
  Map<String, dynamic> json,
) => MarkActivityRequestModel(
  type: $enumDecode(_$ActivityTypeEnumMap, json['type']),
);

Map<String, dynamic> _$MarkActivityRequestModelToJson(
  MarkActivityRequestModel instance,
) => <String, dynamic>{'type': _$ActivityTypeEnumMap[instance.type]!};

const _$ActivityTypeEnumMap = {ActivityType.video: 0, ActivityType.live: 1};
