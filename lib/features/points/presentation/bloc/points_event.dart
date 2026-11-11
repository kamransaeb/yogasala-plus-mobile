part of 'points_bloc.dart';

/// Events for [PointsBloc].
@freezed
abstract class PointsEvent with _$PointsEvent {
  const PointsEvent._();

  /// Load (or reload) the user's points balance.
  const factory PointsEvent.fetched() = _EventFetched;
}
