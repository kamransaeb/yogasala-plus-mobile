part of 'quiz_bloc.dart';

/// Events for [QuizBloc].
@freezed
abstract class QuizEvent with _$QuizEvent {
  const QuizEvent._();

  /// Load quiz + progress for the video.
  const factory QuizEvent.fetched() = _EventFetched;

  /// Submit [answerId] for the current question immediately.
  const factory QuizEvent.answerSelected({
    required int answerId,
  }) = _EventAnswerSelected;

  /// Advance to the next unanswered question, or results when done.
  const factory QuizEvent.nextRequested() = _EventNextRequested;
}
