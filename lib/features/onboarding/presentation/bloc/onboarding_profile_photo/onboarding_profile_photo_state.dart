part of 'onboarding_profile_photo_bloc.dart';

/// State for [OnboardingProfilePhotoBloc].
@freezed
abstract class OnboardingProfilePhotoState with _$OnboardingProfilePhotoState {
  /// Creates a [OnboardingProfilePhotoState].
  const factory OnboardingProfilePhotoState({
    UserYogaSalaPlus? user,
    Uint8List? imageBytes,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
  }) = _OnboardingProfilePhotoState;
}
