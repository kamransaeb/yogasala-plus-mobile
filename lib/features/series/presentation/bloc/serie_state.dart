part of 'serie_bloc.dart';

/// States for [SerieBloc].
@freezed
abstract class SerieState with _$SerieState {
  const SerieState._();

  /// Before first fetch.
  const factory SerieState.initial() = _StateInitial;

  /// Fetch in progress.
  const factory SerieState.loading() = _StateLoading;

  /// Serie, teacher, and episodes loaded.
  const factory SerieState.success({
    required Serie serie,
    @Default(<Video>[]) List<Video> videos,
    Teacher? teacher,
  }) = _StateSuccess;

  /// Fetch failed.
  const factory SerieState.failure({
    required Failure failure,
  }) = _StateFailure;

  /// Whether a load is in progress.
  bool get isLoading => maybeMap(loading: (_) => true, orElse: () => false);

  /// Whether load succeeded.
  bool get isSuccess => maybeMap(success: (_) => true, orElse: () => false);

  /// Whether load failed.
  bool get isFailure => maybeMap(failure: (_) => true, orElse: () => false);

  /// Failure when in failure state.
  Failure? get failureOrNull => maybeMap(
    failure: (s) => s.failure,
    orElse: () => null,
  );

  /// Serie when success.
  Serie? get serieOrNull => maybeMap(
    success: (s) => s.serie,
    orElse: () => null,
  );

  /// Teacher when success (may be null).
  Teacher? get teacherOrNull => maybeMap(
    success: (s) => s.teacher,
    orElse: () => null,
  );

  /// Episodes when success.
  List<Video> get videosOrEmpty => maybeMap(
    success: (s) => s.videos,
    orElse: () => const [],
  );
}
