part of 'quiz_attempt_detail_bloc.dart';

/// States for [QuizAttemptDetailBloc].
@freezed
abstract class QuizAttemptDetailState with _$QuizAttemptDetailState {
  const QuizAttemptDetailState._();

  /// Before first fetch.
  const factory QuizAttemptDetailState.initial() = _StateInitial;

  /// Load in progress.
  const factory QuizAttemptDetailState.loading() = _StateLoading;

  /// Completed attempt loaded.
  const factory QuizAttemptDetailState.success({
    required VideoQuiz quiz,
  }) = _StateSuccess;

  /// Load failed.
  const factory QuizAttemptDetailState.failure({
    required Failure failure,
  }) = _StateFailure;

  /// Whether load succeeded.
  bool get isSuccess => maybeMap(success: (_) => true, orElse: () => false);

  /// Whether load failed.
  bool get isFailure => maybeMap(failure: (_) => true, orElse: () => false);

  /// Quiz when success.
  VideoQuiz? get quizOrNull => maybeMap(
    success: (s) => s.quiz,
    orElse: () => null,
  );

  /// Failure when in failure state.
  Failure? get failureOrNull => maybeMap(
    failure: (s) => s.failure,
    orElse: () => null,
  );
}
