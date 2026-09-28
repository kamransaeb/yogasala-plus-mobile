part of 'onboarding_agreements_bloc.dart';

/// Events for [OnboardingAgreementsBloc].
@freezed
abstract class OnboardingAgreementsEvent with _$OnboardingAgreementsEvent {
  /// Loads the user and remote KVKK / consent copy.
  const factory OnboardingAgreementsEvent.fetched(
    UserYogaSalaPlus userYogaSalaPlus,
  ) = _EventFetched;

  /// KVKK checkbox toggled.
  const factory OnboardingAgreementsEvent.kvkkAgreed({required bool agreed}) =
      _EventKvkkAgreed;

  /// Consent checkbox toggled.
  const factory OnboardingAgreementsEvent.consentAgreed({required bool agreed}) =
      _EventConsentAgreed;

  /// Submit completed profile.
  const factory OnboardingAgreementsEvent.completed() = _EventCompleted;
}
