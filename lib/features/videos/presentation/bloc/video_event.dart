part of 'video_bloc.dart';

/// Events for [VideoBloc].
@freezed
abstract class VideoEvent with _$VideoEvent {
  const VideoEvent._();

  /// Load episode list for the series and resolve the current video.
  const factory VideoEvent.fetched() = _EventFetched;

  /// Add or remove the current video from favorites.
  const factory VideoEvent.favoriteToggled() = _EventFavoriteToggled;
}
