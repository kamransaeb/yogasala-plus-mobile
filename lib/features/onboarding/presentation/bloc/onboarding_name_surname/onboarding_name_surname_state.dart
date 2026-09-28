part of 'onboarding_name_surname_bloc.dart';

/// State for [OnboardingNameSurnameBloc].
@freezed
abstract class OnboardingNameSurnameState with _$OnboardingNameSurnameState {
  /// Creates a [OnboardingNameSurnameState].
  const factory OnboardingNameSurnameState({
    UserYogaSalaPlus? user,
    @Default(NameValidator.pure()) NameValidator nameInput,
    @Default(NameValidator.pure()) NameValidator surnameInput,
  }) = _OnboardingNameSurnameState;

  const OnboardingNameSurnameState._();

  /// Whether both name and surname inputs are valid.
  bool get isValid => Formz.validate([nameInput, surnameInput]);
}
