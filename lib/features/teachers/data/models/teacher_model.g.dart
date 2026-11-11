// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeacherModel _$TeacherModelFromJson(Map<String, dynamic> json) => TeacherModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String? ?? '',
  surname: json['surname'] as String? ?? '',
  imageUrl: json['imageUrl'] as String?,
  bioTr: json['bioTr'] as String?,
  bioEn: json['bioEn'] as String?,
  enabled: json['enabled'] as bool? ?? false,
  createDate: json['createDate'] == null
      ? null
      : DateTime.parse(json['createDate'] as String),
  updateDate: json['updateDate'] == null
      ? null
      : DateTime.parse(json['updateDate'] as String),
);

Map<String, dynamic> _$TeacherModelToJson(TeacherModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'imageUrl': instance.imageUrl,
      'bioTr': instance.bioTr,
      'bioEn': instance.bioEn,
      'enabled': instance.enabled,
      'createDate': instance.createDate?.toIso8601String(),
      'updateDate': instance.updateDate?.toIso8601String(),
    };
