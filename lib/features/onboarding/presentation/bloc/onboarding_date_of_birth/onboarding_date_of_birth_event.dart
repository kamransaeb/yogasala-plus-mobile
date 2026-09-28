part of 'onboarding_date_of_birth_bloc.dart';

/// Events for [OnboardingDateOfBirthBloc].
@freezed
abstract class OnboardingDateOfBirthEvent with _$OnboardingDateOfBirthEvent {
  /// Seeds the form from [userYogaSalaPlus].
  const factory OnboardingDateOfBirthEvent.fetched(
    UserYogaSalaPlus userYogaSalaPlus,
  ) = _EventFetched;

  /// Birth date changed.
  const factory OnboardingDateOfBirthEvent.dateOfBirthChanged(DateTime dateOfBirth) =
      _EventDateOfBirthChanged;
}
