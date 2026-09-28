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
    @Default(<VideoCategorySection>[]) List<VideoCategorySection> sections,
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

  /// Sections when in success state.
  List<VideoCategorySection> get sectionsOrEmpty => maybeMap(
        success: (s) => s.sections,
        orElse: () => const [],
      );
}
