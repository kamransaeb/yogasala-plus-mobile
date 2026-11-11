part of 'quiz_bloc.dart';

/// States for [QuizBloc].
@freezed
abstract class QuizState with _$QuizState {
  const QuizState._();

  /// Before first fetch.
  const factory QuizState.initial() = _StateInitial;

  /// Quiz load in progress.
  const factory QuizState.loading() = _StateLoading;

  /// No quiz / empty questions for this video.
  const factory QuizState.empty() = _StateEmpty;

  /// Quiz loaded (in progress or results).
  const factory QuizState.success({
    required VideoQuiz quiz,
    @Default(0) int currentQuestionIndex,
    @Default(false) bool isSubmitting,
    @Default(false) bool showingResults,
    bool? lastAnswerCorrect,
    int? pointsAwarded,
    int? pointsBalance,
    Failure? actionFailure,
  }) = _StateSuccess;

  /// Quiz load failed.
  const factory QuizState.failure({
    required Failure failure,
  }) = _StateFailure;

  /// Whether a load is in progress.
  bool get isLoading => maybeMap(loading: (_) => true, orElse: () => false);

  /// Whether load succeeded.
  bool get isSuccess => maybeMap(success: (_) => true, orElse: () => false);

  /// Whether load failed.
  bool get isFailure => maybeMap(failure: (_) => true, orElse: () => false);

  /// Whether there is no quiz.
  bool get isEmpty => maybeMap(empty: (_) => true, orElse: () => false);

  /// Whether an answer submit is in flight.
  bool get isSubmitting => maybeMap(
    success: (s) => s.isSubmitting,
    orElse: () => false,
  );

  /// Whether results summary is shown.
  bool get showingResults => maybeMap(
    success: (s) => s.showingResults,
    orElse: () => false,
  );

  /// Failure when in failure state.
  Failure? get failureOrNull => maybeMap(
    failure: (s) => s.failure,
    orElse: () => null,
  );

  /// Submit / refresh action failure when success.
  Failure? get actionFailureOrNull => maybeMap(
    success: (s) => s.actionFailure,
    orElse: () => null,
  );

  /// Quiz when success.
  VideoQuiz? get quizOrNull => maybeMap(
    success: (s) => s.quiz,
    orElse: () => null,
  );

  /// Current question index when success.
  int get currentQuestionIndexOrZero => maybeMap(
    success: (s) => s.currentQuestionIndex,
    orElse: () => 0,
  );

  /// Whether the last submitted answer was correct.
  bool? get lastAnswerCorrectOrNull => maybeMap(
    success: (s) => s.lastAnswerCorrect,
    orElse: () => null,
  );

  /// Points awarded when the quiz first completed (if known).
  int? get pointsAwardedOrNull => maybeMap(
    success: (s) => s.pointsAwarded,
    orElse: () => null,
  );

  /// Current points balance when known.
  int? get pointsBalanceOrNull => maybeMap(
    success: (s) => s.pointsBalance,
    orElse: () => null,
  );

  /// Current question when success and not showing results.
  VideoQuizQuestion? get currentQuestionOrNull => maybeMap(
    success: (s) {
      if (s.showingResults) return null;
      final questions = s.quiz.questions;
      if (s.currentQuestionIndex < 0 ||
          s.currentQuestionIndex >= questions.length) {
        return null;
      }
      return questions[s.currentQuestionIndex];
    },
    orElse: () => null,
  );
}
