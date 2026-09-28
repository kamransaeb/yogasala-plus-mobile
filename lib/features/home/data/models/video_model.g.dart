// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoModel _$VideoModelFromJson(Map<String, dynamic> json) => VideoModel(
  nameTr: json['nameTr'] as String,
  nameEn: json['nameEn'] as String,
  title: json['title'] as String,
  descriptionTr: json['descriptionTr'] as String,
  descriptionEn: json['descriptionEn'] as String,
  free: json['free'] as bool,
  enabled: json['enabled'] as bool,
  id: (json['id'] as num?)?.toInt(),
  videosCategoryId: (json['videosCategoryId'] as num?)?.toInt(),
  createDate: json['createDate'] == null
      ? null
      : DateTime.parse(json['createDate'] as String),
  updateDate: json['updateDate'] == null
      ? null
      : DateTime.parse(json['updateDate'] as String),
  imageUrl: json['imageUrl'] as String?,
  videoUrl: json['videoUrl'] as String?,
  minutes: (json['minutes'] as num?)?.toInt(),
);

Map<String, dynamic> _$VideoModelToJson(VideoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'videosCategoryId': instance.videosCategoryId,
      'createDate': instance.createDate?.toIso8601String(),
      'updateDate': instance.updateDate?.toIso8601String(),
      'nameTr': instance.nameTr,
      'nameEn': instance.nameEn,
      'title': instance.title,
      'descriptionTr': instance.descriptionTr,
      'descriptionEn': instance.descriptionEn,
      'imageUrl': instance.imageUrl,
      'videoUrl': instance.videoUrl,
      'free': instance.free,
      'enabled': instance.enabled,
      'minutes': instance.minutes,
    };
