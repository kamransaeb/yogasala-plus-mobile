part of 'onboarding_gender_bloc.dart';

/// Events for [OnboardingGenderBloc].
@freezed
abstract class OnboardingGenderEvent with _$OnboardingGenderEvent {
  /// Seeds the form from [userYogaSalaPlus].
  const factory OnboardingGenderEvent.fetched(UserYogaSalaPlus userYogaSalaPlus) =
      _EventFetched;

  /// Gender selection changed.
  const factory OnboardingGenderEvent.genderChanged(int gender) = _EventGenderChanged;
}
