import 'package:json_annotation/json_annotation.dart';
import 'package:yogasala_plus_mobile/core/enums/quiz_status.dart';
import 'package:yogasala_plus_mobile/core/utils/model_to_entity_mapper.dart';
import 'package:yogasala_plus_mobile/features/quiz/domain/entities/video_quiz_answer_result.dart';

part 'video_quiz_answer_result_model.g.dart';

/// Serializable submit-answer response (`VideoQuizAnswerResult`).
@JsonSerializable()
class VideoQuizAnswerResultModel
    implements ModelToEntityMapper<VideoQuizAnswerResult> {
  /// Creates a [VideoQuizAnswerResultModel].
  const VideoQuizAnswerResultModel({
    required this.quizId,
    required this.videoId,
    required this.versionId,
    required this.versionNumber,
    required this.attemptId,
    required this.questionId,
    required this.selectedAnswerId,
    required this.correctAnswerId,
    required this.correct,
    required this.status,
    required this.answeredCount,
    required this.totalCount,
    required this.correctCount,
    this.pointsAwarded,
    this.pointsBalance,
  });

  /// JSON constructor.
  factory VideoQuizAnswerResultModel.fromJson(Map<String, dynamic> json) =>
      _$VideoQuizAnswerResultModelFromJson(json);

  /// To JSON.
  Map<String, dynamic> toJson() => _$VideoQuizAnswerResultModelToJson(this);

  /// Quiz id.
  final int quizId;

  /// Video id.
  final int videoId;

  /// Version id.
  final int versionId;

  /// Version number.
  final int versionNumber;

  /// Attempt id.
  final int attemptId;

  /// Question id.
  final int questionId;

  /// Selected answer id.
  final int selectedAnswerId;

  /// Correct answer id.
  final int correctAnswerId;

  /// Whether the selection was correct.
  final bool correct;

  /// Updated quiz status (Short: 0 / 1 / 2).
  @JsonKey(unknownEnumValue: QuizStatus.notStarted)
  final QuizStatus status;

  /// Updated answered count.
  final int answeredCount;

  /// Total questions.
  final int totalCount;

  /// Updated correct count.
  final int correctCount;

  /// Points awarded when this submit completed the quiz.
  final int? pointsAwarded;

  /// Points balance after this submit (when completed).
  final int? pointsBalance;

  @override
  VideoQuizAnswerResult toEntity() => VideoQuizAnswerResult(
        quizId: quizId,
        videoId: videoId,
        versionId: versionId,
        versionNumber: versionNumber,
        attemptId: attemptId,
        questionId: questionId,
        selectedAnswerId: selectedAnswerId,
        correctAnswerId: correctAnswerId,
        correct: correct,
        status: status,
        answeredCount: answeredCount,
        totalCount: totalCount,
        correctCount: correctCount,
        pointsAwarded: pointsAwarded,
        pointsBalance: pointsBalance,
      );
}
