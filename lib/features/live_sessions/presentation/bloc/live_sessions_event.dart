part of 'live_sessions_bloc.dart';

/// Events for [LiveSessionsBloc].
@freezed
abstract class LiveSessionsEvent with _$LiveSessionsEvent {
  const LiveSessionsEvent._();

  /// Load sessions for [date] (defaults to today).
  const factory LiveSessionsEvent.fetched({
    DateTime? date,
  }) = _EventFetched;

  /// Select a calendar day and reload sessions for that day.
  const factory LiveSessionsEvent.dateSelected({
    required int year,
    required int month,
    required int day,
  }) = _EventDateSelected;

  /// Change the visible month without refetching.
  const factory LiveSessionsEvent.monthChanged({
    required int year,
    required int month,
  }) = _EventMonthChanged;

  /// Join a session occurrence.
  const factory LiveSessionsEvent.joinRequested({
    required int slotId,
    required String occurrenceStart,
  }) = _EventJoinRequested;
}
