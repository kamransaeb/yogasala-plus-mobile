import 'package:json_annotation/json_annotation.dart';
import 'package:yogasala_plus_mobile/core/utils/model_to_entity_mapper.dart';
import 'package:yogasala_plus_mobile/features/quiz/domain/entities/video_quiz_attempt_summary.dart';

part 'video_quiz_attempt_summary_model.g.dart';

/// Serializable completed attempt row (`VideoQuizAttemptSummary`).
@JsonSerializable()
class VideoQuizAttemptSummaryModel
    implements ModelToEntityMapper<VideoQuizAttemptSummary> {
  /// Creates a [VideoQuizAttemptSummaryModel].
  const VideoQuizAttemptSummaryModel({
    required this.attemptId,
    required this.quizId,
    required this.videoId,
    required this.versionId,
    required this.versionNumber,
    required this.correctCount,
    required this.totalCount,
    required this.completedAt,
    this.videoNameEn,
    this.videoNameTr,
    this.videoImageUrl,
  });

  /// JSON constructor.
  factory VideoQuizAttemptSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$VideoQuizAttemptSummaryModelFromJson(json);

  /// To JSON.
  Map<String, dynamic> toJson() => _$VideoQuizAttemptSummaryModelToJson(this);

  /// Attempt id.
  final int attemptId;

  /// Quiz id.
  final int quizId;

  /// Video id.
  final int videoId;

  /// Version id.
  final int versionId;

  /// Version number.
  final int versionNumber;

  /// Video name (EN).
  final String? videoNameEn;

  /// Video name (TR).
  final String? videoNameTr;

  /// Video image URL.
  final String? videoImageUrl;

  /// Correct count.
  final int correctCount;

  /// Total count.
  final int totalCount;

  /// Completion timestamp.
  final DateTime completedAt;

  @override
  VideoQuizAttemptSummary toEntity() => VideoQuizAttemptSummary(
        attemptId: attemptId,
        quizId: quizId,
        videoId: videoId,
        versionId: versionId,
        versionNumber: versionNumber,
        videoNameEn: videoNameEn,
        videoNameTr: videoNameTr,
        videoImageUrl: videoImageUrl,
        correctCount: correctCount,
        totalCount: totalCount,
        completedAt: completedAt,
      );
}
