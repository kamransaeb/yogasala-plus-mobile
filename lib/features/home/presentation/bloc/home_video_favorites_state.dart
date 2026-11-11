part of 'home_video_favorites_bloc.dart';

/// States for [HomeVideoFavoritesBloc].
@freezed
abstract class HomeVideoFavoritesState with _$HomeVideoFavoritesState {
  const HomeVideoFavoritesState._();

  /// Before first fetch.
  const factory HomeVideoFavoritesState.initial() = _StateInitial;

  /// First-page load in progress.
  const factory HomeVideoFavoritesState.loading() = _StateLoading;

  /// Favorites page(s) loaded.
  const factory HomeVideoFavoritesState.success({
    @Default(<Video>[]) List<Video> videos,
    @Default(0) int page,
    @Default(0) int totalPages,
    @Default(false) bool isLoadingMore,
    @Default(<int>{}) Set<int> unfavoritingIds,
    Failure? actionFailure,
  }) = _StateSuccess;

  /// First-page load failed.
  const factory HomeVideoFavoritesState.failure({
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

  /// Unfavorite / load-more action failure when success (for flushbar).
  Failure? get actionFailureOrNull => maybeMap(
    success: (s) => s.actionFailure,
    orElse: () => null,
  );

  /// Videos when success.
  List<Video> get videosOrEmpty => maybeMap(
    success: (s) => s.videos,
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

  /// Video ids with an in-flight unfavorite request.
  Set<int> get unfavoritingIdsOrEmpty => maybeMap(
    success: (s) => s.unfavoritingIds,
    orElse: () => const {},
  );
}
