part of 'teacher_bloc.dart';

/// States for [TeacherBloc].
@freezed
abstract class TeacherState with _$TeacherState {
  const TeacherState._();

  /// Before first fetch.
  const factory TeacherState.initial() = _StateInitial;

  /// Fetch in progress.
  const factory TeacherState.loading() = _StateLoading;

  /// Teacher (and series) loaded.
  const factory TeacherState.success({
    required Teacher teacher,
    @Default(<Serie>[]) List<Serie> series,
    @Default(0) int page,
    @Default(0) int totalPages,
    @Default(false) bool isLoadingMore,
    Failure? actionFailure,
  }) = _StateSuccess;

  /// Fetch failed.
  const factory TeacherState.failure({
    required Failure failure,
  }) = _StateFailure;

  /// Whether a load is in progress.
  bool get isLoading => maybeMap(loading: (_) => true, orElse: () => false);

  /// Whether load succeeded.
  bool get isSuccess => maybeMap(success: (_) => true, orElse: () => false);

  /// Whether load failed.
  bool get isFailure => maybeMap(failure: (_) => true, orElse: () => false);

  /// Whether another series page is being fetched.
  bool get isLoadingMore => maybeMap(
    success: (s) => s.isLoadingMore,
    orElse: () => false,
  );

  /// Failure when in failure state.
  Failure? get failureOrNull => maybeMap(
    failure: (s) => s.failure,
    orElse: () => null,
  );

  /// Series action failure when success (for flushbar).
  Failure? get actionFailureOrNull => maybeMap(
    success: (s) => s.actionFailure,
    orElse: () => null,
  );

  /// Teacher when success.
  Teacher? get teacherOrNull => maybeMap(
    success: (s) => s.teacher,
    orElse: () => null,
  );

  /// Series when success.
  List<Serie> get seriesOrEmpty => maybeMap(
    success: (s) => s.series,
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

  /// Whether another series page can be loaded.
  bool get hasMore => maybeMap(
    success: (s) => s.page + 1 < s.totalPages,
    orElse: () => false,
  );
}
