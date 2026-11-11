// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LiveSessionModel _$LiveSessionModelFromJson(Map<String, dynamic> json) =>
    LiveSessionModel(
      slotId: (json['slotId'] as num).toInt(),
      title: json['title'] as String? ?? '',
      weekday: (json['weekday'] as num).toInt(),
      startsAt: json['startsAt'] as String,
      endsAt: json['endsAt'] as String,
      nameTr: json['nameTr'] as String?,
      nameEn: json['nameEn'] as String?,
      descriptionTr: json['descriptionTr'] as String?,
      descriptionEn: json['descriptionEn'] as String?,
      imageUrl: json['imageUrl'] as String?,
      teacherId: (json['teacherId'] as num?)?.toInt(),
      teacherName: json['teacherName'] as String?,
      provider: (json['provider'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LiveSessionModelToJson(LiveSessionModel instance) =>
    <String, dynamic>{
      'slotId': instance.slotId,
      'title': instance.title,
      'nameTr': instance.nameTr,
      'nameEn': instance.nameEn,
      'descriptionTr': instance.descriptionTr,
      'descriptionEn': instance.descriptionEn,
      'imageUrl': instance.imageUrl,
      'teacherId': instance.teacherId,
      'teacherName': instance.teacherName,
      'weekday': instance.weekday,
      'provider': instance.provider,
      'startsAt': instance.startsAt,
      'endsAt': instance.endsAt,
    };
