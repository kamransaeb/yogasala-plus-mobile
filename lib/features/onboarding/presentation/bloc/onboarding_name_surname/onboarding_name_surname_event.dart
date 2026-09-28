part of 'onboarding_name_surname_bloc.dart';

/// Events for [OnboardingNameSurnameBloc].
@freezed
abstract class OnboardingNameSurnameEvent with _$OnboardingNameSurnameEvent {
  /// Seeds the form from [userYogaSalaPlus].
  const factory OnboardingNameSurnameEvent.fetched(
    UserYogaSalaPlus userYogaSalaPlus,
  ) = _EventFetched;

  /// Name field changed.
  const factory OnboardingNameSurnameEvent.nameChanged(String name) =
      _EventNameChanged;

  /// Surname field changed.
  const factory OnboardingNameSurnameEvent.surnameChanged(String surname) =
      _EventSurnameChanged;
}
