// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoModel _$VideoModelFromJson(Map<String, dynamic> json) => VideoModel(
  id: (json['id'] as num?)?.toInt(),
  teacherId: (json['teacherId'] as num?)?.toInt(),
  sortOrder: (json['sortOrder'] as num?)?.toInt(),
  createDate: json['createDate'] == null
      ? null
      : DateTime.parse(json['createDate'] as String),
  updateDate: json['updateDate'] == null
      ? null
      : DateTime.parse(json['updateDate'] as String),
  nameTr: json['nameTr'] as String? ?? '',
  nameEn: json['nameEn'] as String? ?? '',
  title: json['title'] as String? ?? '',
  descriptionTr: json['descriptionTr'] as String? ?? '',
  descriptionEn: json['descriptionEn'] as String? ?? '',
  imageUrl: json['imageUrl'] as String?,
  thumbnailUrl: json['thumbnailUrl'] as String?,
  enabled: json['enabled'] as bool? ?? false,
  muxStatus: $enumDecodeNullable(_$MuxStatusEnumMap, json['muxStatus']),
  muxDurationSeconds: (json['muxDurationSeconds'] as num?)?.toDouble(),
  favorited: json['favorited'] as bool? ?? false,
);

Map<String, dynamic> _$VideoModelToJson(VideoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'teacherId': instance.teacherId,
      'sortOrder': instance.sortOrder,
      'createDate': instance.createDate?.toIso8601String(),
      'updateDate': instance.updateDate?.toIso8601String(),
      'nameTr': instance.nameTr,
      'nameEn': instance.nameEn,
      'title': instance.title,
      'descriptionTr': instance.descriptionTr,
      'descriptionEn': instance.descriptionEn,
      'imageUrl': instance.imageUrl,
      'thumbnailUrl': instance.thumbnailUrl,
      'enabled': instance.enabled,
      'muxStatus': _$MuxStatusEnumMap[instance.muxStatus],
      'muxDurationSeconds': instance.muxDurationSeconds,
      'favorited': instance.favorited,
    };

const _$MuxStatusEnumMap = {
  MuxStatus.waitingUpload: 'WAITING_UPLOAD',
  MuxStatus.preparing: 'PREPARING',
  MuxStatus.ready: 'READY',
  MuxStatus.errored: 'ERRORED',
};
