part of 'video_player_bloc.dart';

/// Events for [VideoPlayerBloc].
@freezed
abstract class VideoPlayerEvent with _$VideoPlayerEvent {
  const VideoPlayerEvent._();

  /// Load signed playback.
  const factory VideoPlayerEvent.fetched() = _EventFetched;

  /// Playback reached the end; mark VIDEO activity once.
  const factory VideoPlayerEvent.videoCompleted() = _EventVideoCompleted;
}
