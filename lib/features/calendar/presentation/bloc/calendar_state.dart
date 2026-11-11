part of 'calendar_bloc.dart';

/// States for [CalendarBloc].
@freezed
abstract class CalendarState with _$CalendarState {
  const CalendarState._();

  /// Before first fetch.
  const factory CalendarState.initial() = _StateInitial;

  /// First load in progress.
  const factory CalendarState.loading() = _StateLoading;

  /// Month markers loaded.
  const factory CalendarState.success({
    required DateTime focusedMonth,
    @Default(<DateTime, UserActivityDay>{})
    Map<DateTime, UserActivityDay> daysByDate,
    UserActivityStreak? streak,
    @Default(false) bool isRefreshing,
    Failure? actionFailure,
  }) = _StateSuccess;

  /// First load failed.
  const factory CalendarState.failure({
    required Failure failure,
  }) = _StateFailure;

  /// Whether a first load is in progress.
  bool get isLoading => maybeMap(loading: (_) => true, orElse: () => false);

  /// Whether load succeeded.
  bool get isSuccess => maybeMap(success: (_) => true, orElse: () => false);

  /// Whether first load failed.
  bool get isFailure => maybeMap(failure: (_) => true, orElse: () => false);

  /// Whether the visible month is reloading.
  bool get isRefreshing => maybeMap(
    success: (s) => s.isRefreshing,
    orElse: () => false,
  );

  /// Failure when in failure state.
  Failure? get failureOrNull => maybeMap(
    failure: (s) => s.failure,
    orElse: () => null,
  );

  /// Soft failure while keeping previous markers.
  Failure? get actionFailureOrNull => maybeMap(
    success: (s) => s.actionFailure,
    orElse: () => null,
  );

  /// Focused month when success.
  DateTime? get focusedMonthOrNull => maybeMap(
    success: (s) => s.focusedMonth,
    orElse: () => null,
  );

  /// Day markers when success (or empty).
  Map<DateTime, UserActivityDay> get daysByDateOrEmpty => maybeMap(
    success: (s) => s.daysByDate,
    orElse: () => const {},
  );

  /// Current streak when success.
  UserActivityStreak? get streakOrNull => maybeMap(
    success: (s) => s.streak,
    orElse: () => null,
  );
}
