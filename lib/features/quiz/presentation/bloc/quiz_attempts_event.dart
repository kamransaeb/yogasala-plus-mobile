part of 'quiz_attempts_bloc.dart';

/// Events for [QuizAttemptsBloc].
@freezed
abstract class QuizAttemptsEvent with _$QuizAttemptsEvent {
  const QuizAttemptsEvent._();

  /// Load (or reload) the first page of completed attempts.
  const factory QuizAttemptsEvent.fetched() = _EventFetched;

  /// Load the next page when the user scrolls near the end.
  const factory QuizAttemptsEvent.nextPageRequested() = _EventNextPageRequested;
}
