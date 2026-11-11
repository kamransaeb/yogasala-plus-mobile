part of 'quiz_attempts_bloc.dart';

/// States for [QuizAttemptsBloc].
@freezed
abstract class QuizAttemptsState with _$QuizAttemptsState {
  const QuizAttemptsState._();

  /// Before first fetch.
  const factory QuizAttemptsState.initial() = _StateInitial;

  /// First-page load in progress.
  const factory QuizAttemptsState.loading() = _StateLoading;

  /// Attempts page(s) loaded.
  const factory QuizAttemptsState.success({
    @Default(<VideoQuizAttemptSummary>[]) List<VideoQuizAttemptSummary> attempts,
    @Default(0) int page,
    @Default(0) int totalPages,
    @Default(false) bool isLoadingMore,
    Failure? actionFailure,
  }) = _StateSuccess;

  /// First-page load failed.
  const factory QuizAttemptsState.failure({
    required Failure failure,
  }) = _StateFailure;

  /// Whether load succeeded.
  bool get isSuccess => maybeMap(success: (_) => true, orElse: () => false);

  /// Whether load failed.
  bool get isFailure => maybeMap(failure: (_) => true, orElse: () => false);

  /// Whether another page is being fetched.
  bool get isLoadingMore => maybeMap(
    success: (s) => s.isLoadingMore,
    orElse: () => false,
  );

  /// Failure when in failure state.
  Failure? get failureOrNull => maybeMap(
    failure: (s) => s.failure,
    orElse: () => null,
  );

  /// Load-more action failure when success.
  Failure? get actionFailureOrNull => maybeMap(
    success: (s) => s.actionFailure,
    orElse: () => null,
  );

  /// Attempts when success.
  List<VideoQuizAttemptSummary> get attemptsOrEmpty => maybeMap(
    success: (s) => s.attempts,
    orElse: () => const [],
  );

  /// Current page index when success.
  int get pageOrZero => maybeMap(
    success: (s) => s.page,
    orElse: () => 0,
  );

  /// Total pages when success.
  int get totalPagesOrZero => maybeMap(
    success: (s) => s.totalPages,
    orElse: () => 0,
  );

  /// Whether another page can be loaded.
  bool get hasMore => maybeMap(
    success: (s) => s.page + 1 < s.totalPages,
    orElse: () => false,
  );
}
