// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_quiz_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoQuizModel _$VideoQuizModelFromJson(Map<String, dynamic> json) =>
    VideoQuizModel(
      videoId: (json['videoId'] as num).toInt(),
      id: (json['id'] as num?)?.toInt(),
      versionId: (json['versionId'] as num?)?.toInt(),
      versionNumber: (json['versionNumber'] as num?)?.toInt(),
      attemptId: (json['attemptId'] as num?)?.toInt(),
      status:
          $enumDecodeNullable(
            _$QuizStatusEnumMap,
            json['status'],
            unknownValue: QuizStatus.notStarted,
          ) ??
          QuizStatus.notStarted,
      answeredCount: (json['answeredCount'] as num?)?.toInt() ?? 0,
      totalCount: (json['totalCount'] as num?)?.toInt() ?? 0,
      correctCount: (json['correctCount'] as num?)?.toInt() ?? 0,
      questions:
          (json['questions'] as List<dynamic>?)
              ?.map(
                (e) =>
                    VideoQuizQuestionModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          [],
    );

Map<String, dynamic> _$VideoQuizModelToJson(VideoQuizModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'videoId': instance.videoId,
      'versionId': instance.versionId,
      'versionNumber': instance.versionNumber,
      'attemptId': instance.attemptId,
      'status': _$QuizStatusEnumMap[instance.status]!,
      'answeredCount': instance.answeredCount,
      'totalCount': instance.totalCount,
      'correctCount': instance.correctCount,
      'questions': instance.questions,
    };

const _$QuizStatusEnumMap = {
  QuizStatus.notStarted: 0,
  QuizStatus.inProgress: 1,
  QuizStatus.completed: 2,
};
