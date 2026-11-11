import 'package:json_annotation/json_annotation.dart';

part 'submit_quiz_answer_request_model.g.dart';

/// Body for submitting one quiz answer.
@JsonSerializable()
class SubmitQuizAnswerRequestModel {
  /// Creates a [SubmitQuizAnswerRequestModel].
  const SubmitQuizAnswerRequestModel({required this.answerId});

  /// JSON constructor.
  factory SubmitQuizAnswerRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SubmitQuizAnswerRequestModelFromJson(json);

  /// To JSON.
  Map<String, dynamic> toJson() => _$SubmitQuizAnswerRequestModelToJson(this);

  /// Selected answer id.
  final int answerId;
}
