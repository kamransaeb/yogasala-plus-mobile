part of 'points_bloc.dart';

/// States for [PointsBloc].
@freezed
abstract class PointsState with _$PointsState {
  const PointsState._();

  /// Before first fetch.
  const factory PointsState.initial() = _StateInitial;

  /// Load in progress.
  const factory PointsState.loading() = _StateLoading;

  /// Balance loaded.
  const factory PointsState.success({
    required int balance,
  }) = _StateSuccess;

  /// Load failed.
  const factory PointsState.failure({
    required Failure failure,
  }) = _StateFailure;

  /// Whether load succeeded.
  bool get isSuccess => maybeMap(success: (_) => true, orElse: () => false);

  /// Whether load failed.
  bool get isFailure => maybeMap(failure: (_) => true, orElse: () => false);

  /// Balance when success.
  int? get balanceOrNull => maybeMap(
    success: (s) => s.balance,
    orElse: () => null,
  );

  /// Failure when in failure state.
  Failure? get failureOrNull => maybeMap(
    failure: (s) => s.failure,
    orElse: () => null,
  );
}
