part of 'home_teachers_bloc.dart';

/// Events for [HomeTeachersBloc].
@freezed
abstract class HomeTeachersEvent with _$HomeTeachersEvent {
  const HomeTeachersEvent._();

  /// Load (or reload) the first page of teachers.
  const factory HomeTeachersEvent.fetched() = _EventFetched;

  /// Load the next page when the user scrolls near the end.
  const factory HomeTeachersEvent.nextPageRequested() = _EventNextPageRequested;
}
