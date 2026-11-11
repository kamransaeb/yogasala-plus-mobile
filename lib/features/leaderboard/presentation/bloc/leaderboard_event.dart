part of 'leaderboard_bloc.dart';

/// Events for [LeaderboardBloc].
@freezed
abstract class LeaderboardEvent with _$LeaderboardEvent {
  const LeaderboardEvent._();

  /// Load (or reload) the first page.
  const factory LeaderboardEvent.fetched() = _EventFetched;

  /// Load the next page when the user scrolls near the end.
  const factory LeaderboardEvent.nextPageRequested() = _EventNextPageRequested;
}
