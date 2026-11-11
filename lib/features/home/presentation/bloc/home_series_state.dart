part of 'home_series_bloc.dart';

/// States for [HomeSeriesBloc].
@freezed
abstract class HomeSeriesState with _$HomeSeriesState {
  const HomeSeriesState._();

  /// Before first fetch.
  const factory HomeSeriesState.initial() = _StateInitial;

  /// First-page load in progress.
  const factory HomeSeriesState.loading() = _StateLoading;

  /// Series page(s) loaded.
  const factory HomeSeriesState.success({
    @Default(<Serie>[]) List<Serie> series,
    @Default('') String query,
    @Default(0) int page,
    @Default(0) int totalPages,
    @Default(false) bool isLoadingMore,
    Failure? actionFailure,
  }) = _StateSuccess;

  /// First-page load failed.
  const factory HomeSeriesState.failure({
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

  /// Load-more / search action failure when success (for flushbar).
  Failure? get actionFailureOrNull => maybeMap(
    success: (s) => s.actionFailure,
    orElse: () => null,
  );

  /// Series when success.
  List<Serie> get seriesOrEmpty => maybeMap(
    success: (s) => s.series,
    orElse: () => const [],
  );

  /// Current search query.
  String get queryOrEmpty => maybeMap(
    success: (s) => s.query,
    orElse: () => '',
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
