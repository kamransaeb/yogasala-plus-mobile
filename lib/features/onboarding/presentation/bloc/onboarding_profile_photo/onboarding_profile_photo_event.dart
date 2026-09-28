part of 'onboarding_profile_photo_bloc.dart';

/// Events for [OnboardingProfilePhotoBloc].
@freezed
abstract class OnboardingProfilePhotoEvent with _$OnboardingProfilePhotoEvent {
  /// Seeds the form from [userYogaSalaPlus].
  const factory OnboardingProfilePhotoEvent.fetched(
    UserYogaSalaPlus userYogaSalaPlus,
  ) = _EventFetched;

  /// Pick an image from the gallery.
  const factory OnboardingProfilePhotoEvent.gallerySelected() = _EventGallerySelected;

  /// Capture an image with the camera.
  const factory OnboardingProfilePhotoEvent.cameraSelected() = _EventCameraSelected;

  /// Clear the selected local image.
  const factory OnboardingProfilePhotoEvent.deleted() = _EventDeleted;

  /// Persist / continue with the current photo selection.
  const factory OnboardingProfilePhotoEvent.saved() = _EventSaved;
}
