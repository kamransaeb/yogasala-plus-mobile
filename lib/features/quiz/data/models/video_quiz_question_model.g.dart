// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_quiz_question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoQuizQuestionModel _$VideoQuizQuestionModelFromJson(
  Map<String, dynamic> json,
) => VideoQuizQuestionModel(
  id: (json['id'] as num).toInt(),
  versionId: (json['versionId'] as num).toInt(),
  questionEn: json['questionEn'] as String? ?? '',
  questionTr: json['questionTr'] as String? ?? '',
  sortOrder: (json['sortOrder'] as num?)?.toInt() ?? 0,
  selectedAnswerId: (json['selectedAnswerId'] as num?)?.toInt(),
  correctAnswerId: (json['correctAnswerId'] as num?)?.toInt(),
  answers:
      (json['answers'] as List<dynamic>?)
          ?.map((e) => VideoQuizAnswerModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
);

Map<String, dynamic> _$VideoQuizQuestionModelToJson(
  VideoQuizQuestionModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'versionId': instance.versionId,
  'questionEn': instance.questionEn,
  'questionTr': instance.questionTr,
  'sortOrder': instance.sortOrder,
  'selectedAnswerId': instance.selectedAnswerId,
  'correctAnswerId': instance.correctAnswerId,
  'answers': instance.answers,
};
