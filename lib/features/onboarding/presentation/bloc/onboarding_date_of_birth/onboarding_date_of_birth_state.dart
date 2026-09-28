part of 'onboarding_date_of_birth_bloc.dart';

/// State for [OnboardingDateOfBirthBloc].
@freezed
abstract class OnboardingDateOfBirthState with _$OnboardingDateOfBirthState {
  /// Creates a [OnboardingDateOfBirthState].
  const factory OnboardingDateOfBirthState({
    required DateTime dateOfBirth,
    UserYogaSalaPlus? user,
  }) = _OnboardingDateOfBirthState;
}
