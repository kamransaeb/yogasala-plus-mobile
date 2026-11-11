// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_quiz_attempt_page_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoQuizAttemptPageResponseModel _$VideoQuizAttemptPageResponseModelFromJson(
  Map<String, dynamic> json,
) => VideoQuizAttemptPageResponseModel(
  content:
      (json['content'] as List<dynamic>?)
          ?.map(
            (e) => VideoQuizAttemptSummaryModel.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      [],
  page: (json['page'] as num?)?.toInt() ?? 0,
  size: (json['size'] as num?)?.toInt() ?? 0,
  totalElements: (json['totalElements'] as num?)?.toInt() ?? 0,
  totalPages: (json['totalPages'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$VideoQuizAttemptPageResponseModelToJson(
  VideoQuizAttemptPageResponseModel instance,
) => <String, dynamic>{
  'content': instance.content,
  'page': instance.page,
  'size': instance.size,
  'totalElements': instance.totalElements,
  'totalPages': instance.totalPages,
};
