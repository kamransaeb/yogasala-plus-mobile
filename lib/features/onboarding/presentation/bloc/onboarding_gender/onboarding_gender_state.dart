part of 'onboarding_gender_bloc.dart';

/// State for [OnboardingGenderBloc].
@freezed
abstract class OnboardingGenderState with _$OnboardingGenderState {
  /// Creates a [OnboardingGenderState].
  ///
  /// [gender]: `-1` none, `0` male, `1` female, `2` not shared.
  const factory OnboardingGenderState({
    UserYogaSalaPlus? user,
    @Default(-1) int gender,
  }) = _OnboardingGenderState;
}
