part of 'video_player_bloc.dart';

/// States for [VideoPlayerBloc].
@freezed
abstract class VideoPlayerState with _$VideoPlayerState {
  const VideoPlayerState._();

  /// Before first fetch.
  const factory VideoPlayerState.initial() = _StateInitial;

  /// Fetch in progress.
  const factory VideoPlayerState.loading() = _StateLoading;

  /// Playback ready.
  const factory VideoPlayerState.success({
    required Playback playback,
    @Default(false) bool activityMarked,
    @Default(false) bool isMarkingActivity,
  }) = _StateSuccess;

  /// Fetch failed.
  const factory VideoPlayerState.failure({
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

  /// Playback when success.
  Playback? get playbackOrNull => maybeMap(
    success: (s) => s.playback,
    orElse: () => null,
  );

  /// Whether VIDEO activity was marked for today after watching to the end.
  bool get activityMarked => maybeMap(
    success: (s) => s.activityMarked,
    orElse: () => false,
  );

  /// Whether a mark request is in flight.
  bool get isMarkingActivity => maybeMap(
    success: (s) => s.isMarkingActivity,
    orElse: () => false,
  );
}
