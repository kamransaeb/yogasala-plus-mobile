part of 'live_sessions_bloc.dart';

/// States for [LiveSessionsBloc].
@freezed
abstract class LiveSessionsState with _$LiveSessionsState {
  const LiveSessionsState._();

  /// Before first fetch.
  const factory LiveSessionsState.initial() = _StateInitial;

  /// List loading.
  const factory LiveSessionsState.loading({
    required DateTime selectedDate,
    required DateTime focusedMonth,
  }) = _StateLoading;

  /// Sessions loaded for [selectedDate].
  const factory LiveSessionsState.success({
    required DateTime selectedDate,
    required DateTime focusedMonth,
    @Default(<LiveSession>[]) List<LiveSession> sessions,
    @Default(false) bool hasLiveEntitlement,
    @Default(false) bool isJoining,
    @Default(false) bool isRefreshing,
    int? joiningSlotId,
    LiveJoin? joinResult,
    @Default(false) bool requiresPremiumUpgrade,
    Failure? actionFailure,
  }) = _StateSuccess;

  /// List load failed.
  const factory LiveSessionsState.failure({
    required Failure failure,
    required DateTime selectedDate,
    required DateTime focusedMonth,
  }) = _StateFailure;

  /// Whether list is loading.
  bool get isLoading => maybeMap(loading: (_) => true, orElse: () => false);

  /// Whether list loaded.
  bool get isSuccess => maybeMap(success: (_) => true, orElse: () => false);

  /// Whether list load failed.
  bool get isFailure => maybeMap(failure: (_) => true, orElse: () => false);

  /// Whether a day reload is in flight while keeping the calendar.
  bool get isRefreshing => maybeMap(
        success: (s) => s.isRefreshing,
        orElse: () => false,
      );

  /// Whether a join is in flight.
  bool get isJoining => maybeMap(
        success: (s) => s.isJoining,
        orElse: () => false,
      );

  /// Failure when in failure state.
  Failure? get failureOrNull => maybeMap(
        failure: (s) => s.failure,
        orElse: () => null,
      );

  /// Action failure when success.
  Failure? get actionFailureOrNull => maybeMap(
        success: (s) => s.actionFailure,
        orElse: () => null,
      );

  /// Sessions when success.
  List<LiveSession> get sessionsOrEmpty => maybeMap(
        success: (s) => s.sessions,
        orElse: () => const [],
      );

  /// Whether user has LIVE.
  bool get hasLiveEntitlement => maybeMap(
        success: (s) => s.hasLiveEntitlement,
        orElse: () => false,
      );

  /// Join result to launch externally.
  LiveJoin? get joinResultOrNull => maybeMap(
        success: (s) => s.joinResult,
        orElse: () => null,
      );

  /// Whether UI should open PREMIUM paywall.
  bool get requiresPremiumUpgrade => maybeMap(
        success: (s) => s.requiresPremiumUpgrade,
        orElse: () => false,
      );

  /// Slot currently joining.
  int? get joiningSlotIdOrNull => maybeMap(
        success: (s) => s.joiningSlotId,
        orElse: () => null,
      );

  /// Selected calendar day when known.
  DateTime? get selectedDateOrNull => maybeMap(
        loading: (s) => s.selectedDate,
        success: (s) => s.selectedDate,
        failure: (s) => s.selectedDate,
        orElse: () => null,
      );

  /// Visible month when known.
  DateTime? get focusedMonthOrNull => maybeMap(
        loading: (s) => s.focusedMonth,
        success: (s) => s.focusedMonth,
        failure: (s) => s.focusedMonth,
        orElse: () => null,
      );
}
