part of 'home_bloc.dart';

/// Events for [HomeBloc].
@freezed
abstract class HomeEvent with _$HomeEvent {
  const HomeEvent._();

  /// Load categories and videos for the home feed.
  const factory HomeEvent.fetched() = _EventFetched;
}
