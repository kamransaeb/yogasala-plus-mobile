part of 'home_video_favorites_bloc.dart';

/// Events for [HomeVideoFavoritesBloc].
@freezed
abstract class HomeVideoFavoritesEvent with _$HomeVideoFavoritesEvent {
  const HomeVideoFavoritesEvent._();

  /// Load (or reload) the first page of favorite videos.
  const factory HomeVideoFavoritesEvent.fetched() = _EventFetched;

  /// Load the next page when the user scrolls near the end.
  const factory HomeVideoFavoritesEvent.nextPageRequested() =
      _EventNextPageRequested;

  /// Remove [videoId] from favorites.
  const factory HomeVideoFavoritesEvent.unfavoriteRequested({
    required int videoId,
  }) = _EventUnfavoriteRequested;
}
