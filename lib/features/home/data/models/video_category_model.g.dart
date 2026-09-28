// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoCategoryModel _$VideoCategoryModelFromJson(Map<String, dynamic> json) =>
    VideoCategoryModel(
      nameTr: json['nameTr'] as String,
      nameEn: json['nameEn'] as String,
      title: json['title'] as String,
      descriptionTr: json['descriptionTr'] as String,
      descriptionEn: json['descriptionEn'] as String,
      enabled: json['enabled'] as bool,
      id: (json['id'] as num?)?.toInt(),
      createDate: json['createDate'] == null
          ? null
          : DateTime.parse(json['createDate'] as String),
      updateDate: json['updateDate'] == null
          ? null
          : DateTime.parse(json['updateDate'] as String),
    );

Map<String, dynamic> _$VideoCategoryModelToJson(VideoCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createDate': instance.createDate?.toIso8601String(),
      'updateDate': instance.updateDate?.toIso8601String(),
      'nameTr': instance.nameTr,
      'nameEn': instance.nameEn,
      'title': instance.title,
      'descriptionTr': instance.descriptionTr,
      'descriptionEn': instance.descriptionEn,
      'enabled': instance.enabled,
    };
