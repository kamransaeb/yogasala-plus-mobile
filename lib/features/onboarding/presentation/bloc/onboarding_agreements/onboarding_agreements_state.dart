part of 'onboarding_agreements_bloc.dart';

/// State for [OnboardingAgreementsBloc].
@freezed
abstract class OnboardingAgreementsState with _$OnboardingAgreementsState {
  /// Creates a [OnboardingAgreementsState].
  const factory OnboardingAgreementsState({
    UserYogaSalaPlus? user,
    @Default('') String kvkkText,
    @Default('') String consentText,
    @Default(false) bool kvkkAgreed,
    @Default(false) bool consentAgreed,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    Failure? failure,
  }) = _OnboardingAgreementsState;

  const OnboardingAgreementsState._();

  /// Whether both agreements are checked.
  bool get isValid => kvkkAgreed && consentAgreed;
}
