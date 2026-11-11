part of 'leaderboard_bloc.dart';

/// States for [LeaderboardBloc].
@freezed
abstract class LeaderboardState with _$LeaderboardState {
  const LeaderboardState._();

  /// Before first fetch.
  const factory LeaderboardState.initial() = _StateInitial;

  /// First-page load in progress.
  const factory LeaderboardState.loading() = _StateLoading;

  /// Leaderboard page(s) loaded.
  const factory LeaderboardState.success({
    @Default(<UserPointsLeaderboardEntry>[])
    List<UserPointsLeaderboardEntry> entries,
    @Default(0) int page,
    @Default(0) int totalPages,
    @Default(false) bool isLoadingMore,
    Failure? actionFailure,
    int? badgeLevelOne,
    int? badgeLevelTwo,
    int? badgeLevelThree,
  }) = _StateSuccess;

  /// First-page load failed.
  const factory LeaderboardState.failure({
    required Failure failure,
  }) = _StateFailure;

  /// Whether a first-page load is in progress.
  bool get isLoading => maybeMap(loading: (_) => true, orElse: () => false);

  /// Whether load succeeded.
  bool get isSuccess => maybeMap(success: (_) => true, orElse: () => false);

  /// Whether first-page load failed.
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

  /// Load-more action failure when success (for flushbar).
  Failure? get actionFailureOrNull => maybeMap(
    success: (s) => s.actionFailure,
    orElse: () => null,
  );

  /// Entries when success.
  List<UserPointsLeaderboardEntry> get entriesOrEmpty => maybeMap(
    success: (s) => s.entries,
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

  /// Badge level one threshold when success.
  int? get badgeLevelOneOrNull => maybeMap(
    success: (s) => s.badgeLevelOne,
    orElse: () => null,
  );

  /// Badge level two threshold when success.
  int? get badgeLevelTwoOrNull => maybeMap(
    success: (s) => s.badgeLevelTwo,
    orElse: () => null,
  );

  /// Badge level three threshold when success.
  int? get badgeLevelThreeOrNull => maybeMap(
    success: (s) => s.badgeLevelThree,
    orElse: () => null,
  );
}
