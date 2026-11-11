import 'package:freezed_annotation/freezed_annotation.dart';

/// Progress of a video quiz for the current user.
///
/// Wire values are Short: `0` NOT_STARTED, `1` IN_PROGRESS, `2` COMPLETED.
enum QuizStatus {
  /// No answers submitted yet (`0`).
  @JsonValue(0)
  notStarted,

  /// At least one answer submitted; not all questions done (`1`).
  @JsonValue(1)
  inProgress,

  /// All questions answered; quiz is locked to results (`2`).
  @JsonValue(2)
  completed,
}
