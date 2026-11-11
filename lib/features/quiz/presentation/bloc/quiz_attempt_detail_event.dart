part of 'quiz_attempt_detail_bloc.dart';

/// Events for [QuizAttemptDetailBloc].
@freezed
abstract class QuizAttemptDetailEvent with _$QuizAttemptDetailEvent {
  const QuizAttemptDetailEvent._();

  /// Load the attempt detail.
  const factory QuizAttemptDetailEvent.fetched() = _EventFetched;
}
