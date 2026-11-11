part of 'serie_bloc.dart';

/// Events for [SerieBloc].
@freezed
abstract class SerieEvent with _$SerieEvent {
  const SerieEvent._();

  /// Load series + episodes.
  const factory SerieEvent.fetched() = _EventFetched;
}
