// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_page_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeacherPageResponseModel _$TeacherPageResponseModelFromJson(
  Map<String, dynamic> json,
) => TeacherPageResponseModel(
  content:
      (json['content'] as List<dynamic>?)
          ?.map((e) => TeacherModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  page: (json['page'] as num?)?.toInt() ?? 0,
  size: (json['size'] as num?)?.toInt() ?? 0,
  totalElements: (json['totalElements'] as num?)?.toInt() ?? 0,
  totalPages: (json['totalPages'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$TeacherPageResponseModelToJson(
  TeacherPageResponseModel instance,
) => <String, dynamic>{
  'content': instance.content,
  'page': instance.page,
  'size': instance.size,
  'totalElements': instance.totalElements,
  'totalPages': instance.totalPages,
};
