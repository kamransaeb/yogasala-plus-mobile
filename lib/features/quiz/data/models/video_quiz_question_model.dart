import 'package:json_annotation/json_annotation.dart';
import 'package:yogasala_plus_mobile/core/utils/model_to_entity_mapper.dart';
import 'package:yogasala_plus_mobile/features/quiz/data/models/video_quiz_answer_model.dart';
import 'package:yogasala_plus_mobile/features/quiz/domain/entities/video_quiz_question.dart';

part 'video_quiz_question_model.g.dart';

/// Serializable quiz question (`VideoQuizQuestion`).
@JsonSerializable()
class VideoQuizQuestionModel
    implements ModelToEntityMapper<VideoQuizQuestion> {
  /// Creates a [VideoQuizQuestionModel].
  const VideoQuizQuestionModel({
    required this.id,
    required this.versionId,
    this.questionEn = '',
    this.questionTr = '',
    this.sortOrder = 0,
    this.selectedAnswerId,
    this.correctAnswerId,
    this.answers = const [],
  });

  /// JSON constructor.
  factory VideoQuizQuestionModel.fromJson(Map<String, dynamic> json) =>
      _$VideoQuizQuestionModelFromJson(json);

  /// To JSON.
  Map<String, dynamic> toJson() => _$VideoQuizQuestionModelToJson(this);

  /// Server id.
  final int id;

  /// Parent quiz version id.
  final int versionId;

  /// Question text (EN).
  @JsonKey(defaultValue: '')
  final String questionEn;

  /// Question text (TR).
  @JsonKey(defaultValue: '')
  final String questionTr;

  /// Display order.
  @JsonKey(defaultValue: 0)
  final int sortOrder;

  /// Selected answer when already answered.
  final int? selectedAnswerId;

  /// Correct answer when revealed.
  final int? correctAnswerId;

  /// Answer options.
  @JsonKey(defaultValue: <VideoQuizAnswerModel>[])
  final List<VideoQuizAnswerModel> answers;

  @override
  VideoQuizQuestion toEntity() {
    final mappedAnswers = answers.map((e) => e.toEntity()).toList()
      ..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));
    return VideoQuizQuestion(
      id: id,
      versionId: versionId,
      questionEn: questionEn,
      questionTr: questionTr,
      sortOrder: sortOrder,
      selectedAnswerId: selectedAnswerId,
      correctAnswerId: correctAnswerId,
      answers: mappedAnswers,
    );
  }
}
