part of 'home_series_bloc.dart';

/// Events for [HomeSeriesBloc].
@freezed
abstract class HomeSeriesEvent with _$HomeSeriesEvent {
  const HomeSeriesEvent._();

  /// Load (or reload) the first page for the current query.
  const factory HomeSeriesEvent.fetched() = _EventFetched;

  /// Update the name filter and reload from page 0 (debounced).
  const factory HomeSeriesEvent.queryChanged({
    required String query,
  }) = _EventQueryChanged;

  /// Load the next page when the user scrolls near the end.
  const factory HomeSeriesEvent.nextPageRequested() = _EventNextPageRequested;
}
