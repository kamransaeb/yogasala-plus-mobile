part of 'profile_info_bloc.dart';

/// Events for [ProfileInfoBloc].
@freezed
abstract class ProfileInfoEvent with _$ProfileInfoEvent {
  /// Seeds the form from [userYogaSalaPlus].
  const factory ProfileInfoEvent.fetched(
    UserYogaSalaPlus userYogaSalaPlus,
  ) = _EventFetched;

  /// Name field changed.
  const factory ProfileInfoEvent.nameChanged(String name) = _EventNameChanged;

  /// Surname field changed.
  const factory ProfileInfoEvent.surnameChanged(String surname) =
      _EventSurnameChanged;

  /// Date of birth changed.
  const factory ProfileInfoEvent.dateOfBirthChanged(DateTime dateOfBirth) =
      _EventDateOfBirthChanged;

  /// Gender changed (`0` male, `1` female, `2` not shared).
  const factory ProfileInfoEvent.genderChanged(int gender) =
      _EventGenderChanged;

  /// Pick an image from the gallery.
  const factory ProfileInfoEvent.gallerySelected() = _EventGallerySelected;

  /// Capture an image with the camera.
  const factory ProfileInfoEvent.cameraSelected() = _EventCameraSelected;

  /// Clear the selected / existing profile image.
  const factory ProfileInfoEvent.photoDeleted() = _EventPhotoDeleted;

  /// Persist profile fields and photo together.
  const factory ProfileInfoEvent.saved() = _EventSaved;
}
