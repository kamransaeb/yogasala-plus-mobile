part of 'calendar_bloc.dart';

/// Events for [CalendarBloc].
@freezed
abstract class CalendarEvent with _$CalendarEvent {
  const CalendarEvent._();

  /// Load the current month.
  const factory CalendarEvent.fetched() = _EventFetched;

  /// Navigate to another month and reload markers.
  const factory CalendarEvent.monthChanged({
    required int year,
    required int month,
  }) = _EventMonthChanged;
}
