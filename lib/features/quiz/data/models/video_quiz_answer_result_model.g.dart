// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_quiz_answer_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoQuizAnswerResultModel _$VideoQuizAnswerResultModelFromJson(
  Map<String, dynamic> json,
) => VideoQuizAnswerResultModel(
  quizId: (json['quizId'] as num).toInt(),
  videoId: (json['videoId'] as num).toInt(),
  versionId: (json['versionId'] as num).toInt(),
  versionNumber: (json['versionNumber'] as num).toInt(),
  attemptId: (json['attemptId'] as num).toInt(),
  questionId: (json['questionId'] as num).toInt(),
  selectedAnswerId: (json['selectedAnswerId'] as num).toInt(),
  correctAnswerId: (json['correctAnswerId'] as num).toInt(),
  correct: json['correct'] as bool,
  status: $enumDecode(
    _$QuizStatusEnumMap,
    json['status'],
    unknownValue: QuizStatus.notStarted,
  ),
  answeredCount: (json['answeredCount'] as num).toInt(),
  totalCount: (json['totalCount'] as num).toInt(),
  correctCount: (json['correctCount'] as num).toInt(),
  pointsAwarded: (json['pointsAwarded'] as num?)?.toInt(),
  pointsBalance: (json['pointsBalance'] as num?)?.toInt(),
);

Map<String, dynamic> _$VideoQuizAnswerResultModelToJson(
  VideoQuizAnswerResultModel instance,
) => <String, dynamic>{
  'quizId': instance.quizId,
  'videoId': instance.videoId,
  'versionId': instance.versionId,
  'versionNumber': instance.versionNumber,
  'attemptId': instance.attemptId,
  'questionId': instance.questionId,
  'selectedAnswerId': instance.selectedAnswerId,
  'correctAnswerId': instance.correctAnswerId,
  'correct': instance.correct,
  'status': _$QuizStatusEnumMap[instance.status]!,
  'answeredCount': instance.answeredCount,
  'totalCount': instance.totalCount,
  'correctCount': instance.correctCount,
  'pointsAwarded': instance.pointsAwarded,
  'pointsBalance': instance.pointsBalance,
};

const _$QuizStatusEnumMap = {
  QuizStatus.notStarted: 0,
  QuizStatus.inProgress: 1,
  QuizStatus.completed: 2,
};
