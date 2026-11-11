import 'package:json_annotation/json_annotation.dart';
import 'package:yogasala_plus_mobile/core/enums/quiz_status.dart';
import 'package:yogasala_plus_mobile/core/utils/model_to_entity_mapper.dart';
import 'package:yogasala_plus_mobile/features/quiz/data/models/video_quiz_question_model.dart';
import 'package:yogasala_plus_mobile/features/quiz/domain/entities/video_quiz.dart';

part 'video_quiz_model.g.dart';

/// Serializable video quiz payload (`VideoQuiz`).
@JsonSerializable()
class VideoQuizModel implements ModelToEntityMapper<VideoQuiz> {
  /// Creates a [VideoQuizModel].
  const VideoQuizModel({
    required this.videoId,
    this.id,
    this.versionId,
    this.versionNumber,
    this.attemptId,
    this.status = QuizStatus.notStarted,
    this.answeredCount = 0,
    this.totalCount = 0,
    this.correctCount = 0,
    this.questions = const [],
  });

  /// JSON constructor.
  factory VideoQuizModel.fromJson(Map<String, dynamic> json) =>
      _$VideoQuizModelFromJson(json);

  /// To JSON.
  Map<String, dynamic> toJson() => _$VideoQuizModelToJson(this);

  /// Server quiz id.
  final int? id;

  /// Parent video id.
  final int videoId;

  /// Published version id.
  final int? versionId;

  /// Version number.
  final int? versionNumber;

  /// Attempt id when in progress or completed.
  final int? attemptId;

  /// Progress status (Short: 0 / 1 / 2).
  @JsonKey(unknownEnumValue: QuizStatus.notStarted)
  final QuizStatus status;

  /// Answered question count.
  @JsonKey(defaultValue: 0)
  final int answeredCount;

  /// Total question count.
  @JsonKey(defaultValue: 0)
  final int totalCount;

  /// Correct answer count.
  @JsonKey(defaultValue: 0)
  final int correctCount;

  /// Questions.
  @JsonKey(defaultValue: <VideoQuizQuestionModel>[])
  final List<VideoQuizQuestionModel> questions;

  @override
  VideoQuiz toEntity() {
    final mappedQuestions = questions.map((e) => e.toEntity()).toList()
      ..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));
    return VideoQuiz(
      id: id,
      videoId: videoId,
      versionId: versionId,
      versionNumber: versionNumber,
      attemptId: attemptId,
      status: status,
      answeredCount: answeredCount,
      totalCount: totalCount,
      correctCount: correctCount,
      questions: mappedQuestions,
    );
  }
}
