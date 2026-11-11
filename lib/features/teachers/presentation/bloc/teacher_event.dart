part of 'teacher_bloc.dart';

/// Events for [TeacherBloc].
@freezed
abstract class TeacherEvent with _$TeacherEvent {
  const TeacherEvent._();

  /// Load teacher and first page of series.
  const factory TeacherEvent.fetched() = _EventFetched;

  /// Load the next page of series.
  const factory TeacherEvent.nextPageRequested() = _EventNextPageRequested;
}
