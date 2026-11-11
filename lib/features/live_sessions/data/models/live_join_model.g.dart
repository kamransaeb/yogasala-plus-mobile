// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_join_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LiveJoinModel _$LiveJoinModelFromJson(Map<String, dynamic> json) =>
    LiveJoinModel(
      slotId: (json['slotId'] as num).toInt(),
      provider: (json['provider'] as num).toInt(),
      joinUrl: json['joinUrl'] as String? ?? '',
      occurrenceStart: json['occurrenceStart'] as String,
    );

Map<String, dynamic> _$LiveJoinModelToJson(LiveJoinModel instance) =>
    <String, dynamic>{
      'slotId': instance.slotId,
      'provider': instance.provider,
      'joinUrl': instance.joinUrl,
      'occurrenceStart': instance.occurrenceStart,
    };
