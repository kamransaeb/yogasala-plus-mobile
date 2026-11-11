// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SerieModel _$SerieModelFromJson(Map<String, dynamic> json) => SerieModel(
  id: (json['id'] as num?)?.toInt(),
  teacherId: (json['teacherId'] as num?)?.toInt(),
  categoryIds:
      (json['categoryIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      const [],
  videoIds:
      (json['videoIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      const [],
  createDate: json['createDate'] == null
      ? null
      : DateTime.parse(json['createDate'] as String),
  updateDate: json['updateDate'] == null
      ? null
      : DateTime.parse(json['updateDate'] as String),
  title: json['title'] as String? ?? '',
  nameTr: json['nameTr'] as String? ?? '',
  nameEn: json['nameEn'] as String? ?? '',
  descriptionTr: json['descriptionTr'] as String? ?? '',
  descriptionEn: json['descriptionEn'] as String? ?? '',
  imageUrl: json['imageUrl'] as String?,
  free: json['free'] as bool? ?? false,
  enabled: json['enabled'] as bool? ?? false,
  totalDurationSeconds: (json['totalDurationSeconds'] as num?)?.toDouble(),
);

Map<String, dynamic> _$SerieModelToJson(SerieModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'teacherId': instance.teacherId,
      'categoryIds': instance.categoryIds,
      'videoIds': instance.videoIds,
      'createDate': instance.createDate?.toIso8601String(),
      'updateDate': instance.updateDate?.toIso8601String(),
      'title': instance.title,
      'nameTr': instance.nameTr,
      'nameEn': instance.nameEn,
      'descriptionTr': instance.descriptionTr,
      'descriptionEn': instance.descriptionEn,
      'imageUrl': instance.imageUrl,
      'free': instance.free,
      'enabled': instance.enabled,
      'totalDurationSeconds': instance.totalDurationSeconds,
    };
