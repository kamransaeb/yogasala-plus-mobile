import 'package:json_annotation/json_annotation.dart';
import 'package:yogasala_plus_mobile/core/utils/model_to_entity_mapper.dart';
import 'package:yogasala_plus_mobile/features/quiz/domain/entities/video_quiz_answer.dart';

part 'video_quiz_answer_model.g.dart';

/// Serializable quiz answer option (`VideoQuizQuestionAnswer`).
@JsonSerializable()
class VideoQuizAnswerModel implements ModelToEntityMapper<VideoQuizAnswer> {
  /// Creates a [VideoQuizAnswerModel].
  const VideoQuizAnswerModel({
    required this.id,
    this.answerEn = '',
    this.answerTr = '',
    this.sortOrder = 0,
    this.correct,
  });

  /// JSON constructor.
  factory VideoQuizAnswerModel.fromJson(Map<String, dynamic> json) =>
      _$VideoQuizAnswerModelFromJson(json);

  /// To JSON.
  Map<String, dynamic> toJson() => _$VideoQuizAnswerModelToJson(this);

  /// Server id.
  final int id;

  /// Answer text (EN).
  @JsonKey(defaultValue: '')
  final String answerEn;

  /// Answer text (TR).
  @JsonKey(defaultValue: '')
  final String answerTr;

  /// Display order.
  @JsonKey(defaultValue: 0)
  final int sortOrder;

  /// Correctness when revealed.
  final bool? correct;

  @override
  VideoQuizAnswer toEntity() => VideoQuizAnswer(
        id: id,
        answerEn: answerEn,
        answerTr: answerTr,
        sortOrder: sortOrder,
        correct: correct,
      );
}
