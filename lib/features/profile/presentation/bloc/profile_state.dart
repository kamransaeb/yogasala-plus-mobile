part of 'profile_bloc.dart';

/// States for [ProfileBloc].
@freezed
abstract class ProfileState with _$ProfileState {
  const ProfileState._();

  /// Before first fetch.
  const factory ProfileState.initial() = _StateInitial;

  /// Fetch in progress.
  const factory ProfileState.loading() = _StateLoading;

  /// User loaded (with optional badge thresholds from LocalStorage).
  const factory ProfileState.success({
    required UserYogaSalaPlus user,
    int? badgeLevelOne,
    int? badgeLevelTwo,
    int? badgeLevelThree,
  }) = _StateSuccess;

  /// Fetch failed.
  const factory ProfileState.failure({
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

  /// User when success.
  UserYogaSalaPlus? get userOrNull => maybeMap(
    success: (s) => s.user,
    orElse: () => null,
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
