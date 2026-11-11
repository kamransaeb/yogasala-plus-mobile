part of 'home_bloc.dart';

/// States for [HomeBloc].
@freezed
abstract class HomeState with _$HomeState {
  const HomeState._();

  /// Before first fetch.
  const factory HomeState.initial() = _StateInitial;

  /// Fetch in progress.
  const factory HomeState.loading() = _StateLoading;

  /// Feed loaded.
  const factory HomeState.success({
    @Default(<CategorySection>[]) List<CategorySection> categorySections,
    @Default(<int, Teacher>{}) Map<int, Teacher> teachersById,
    Failure? actionFailure,
  }) = _StateSuccess;

  /// Fetch failed.
  const factory HomeState.failure({
    required Failure failure,
  }) = _StateFailure;

  /// Whether a load is in progress.
  bool get isLoading => maybeMap(loading: (_) => true, orElse: () => false);

  /// Whether the feed loaded successfully.
  bool get isSuccess => maybeMap(success: (_) => true, orElse: () => false);

  /// Whether the feed failed.
  bool get isFailure => maybeMap(failure: (_) => true, orElse: () => false);

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

  /// Sections when in success state.
  List<CategorySection> get categorySectionsOrEmpty => maybeMap(
    success: (s) => s.categorySections,
    orElse: () => const [],
  );

  /// Teachers keyed by id when in success state.
  Map<int, Teacher> get teachersByIdOrEmpty => maybeMap(
    success: (s) => s.teachersById,
    orElse: () => const {},
  );
}
