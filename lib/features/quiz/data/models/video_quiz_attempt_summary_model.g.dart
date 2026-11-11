// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_quiz_attempt_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoQuizAttemptSummaryModel _$VideoQuizAttemptSummaryModelFromJson(
  Map<String, dynamic> json,
) => VideoQuizAttemptSummaryModel(
  attemptId: (json['attemptId'] as num).toInt(),
  quizId: (json['quizId'] as num).toInt(),
  videoId: (json['videoId'] as num).toInt(),
  versionId: (json['versionId'] as num).toInt(),
  versionNumber: (json['versionNumber'] as num).toInt(),
  correctCount: (json['correctCount'] as num).toInt(),
  totalCount: (json['totalCount'] as num).toInt(),
  completedAt: DateTime.parse(json['completedAt'] as String),
  videoNameEn: json['videoNameEn'] as String?,
  videoNameTr: json['videoNameTr'] as String?,
  videoImageUrl: json['videoImageUrl'] as String?,
);

Map<String, dynamic> _$VideoQuizAttemptSummaryModelToJson(
  VideoQuizAttemptSummaryModel instance,
) => <String, dynamic>{
  'attemptId': instance.attemptId,
  'quizId': instance.quizId,
  'videoId': instance.videoId,
  'versionId': instance.versionId,
  'versionNumber': instance.versionNumber,
  'videoNameEn': instance.videoNameEn,
  'videoNameTr': instance.videoNameTr,
  'videoImageUrl': instance.videoImageUrl,
  'correctCount': instance.correctCount,
  'totalCount': instance.totalCount,
  'completedAt': instance.completedAt.toIso8601String(),
};
