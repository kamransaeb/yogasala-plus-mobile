part of 'terms_of_service_bloc.dart';

/// Events for [TermsOfServiceBloc].
@freezed
abstract class TermsOfServiceEvent with _$TermsOfServiceEvent {
  const TermsOfServiceEvent._();

  /// Load cached terms / consent texts.
  const factory TermsOfServiceEvent.fetched() = _EventFetched;
}
