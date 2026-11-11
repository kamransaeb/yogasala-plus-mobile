// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_quiz_answer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoQuizAnswerModel _$VideoQuizAnswerModelFromJson(
  Map<String, dynamic> json,
) => VideoQuizAnswerModel(
  id: (json['id'] as num).toInt(),
  answerEn: json['answerEn'] as String? ?? '',
  answerTr: json['answerTr'] as String? ?? '',
  sortOrder: (json['sortOrder'] as num?)?.toInt() ?? 0,
  correct: json['correct'] as bool?,
);

Map<String, dynamic> _$VideoQuizAnswerModelToJson(
  VideoQuizAnswerModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'answerEn': instance.answerEn,
  'answerTr': instance.answerTr,
  'sortOrder': instance.sortOrder,
  'correct': instance.correct,
};
