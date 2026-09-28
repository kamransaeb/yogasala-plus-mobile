import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/profile/domain/entities/user_yoga_sala_plus.dart';

part 'onboarding_profile_photo_event.dart';
part 'onboarding_profile_photo_state.dart';
part 'onboarding_profile_photo_bloc.freezed.dart';

/// Owns profile-photo picking for onboarding step 4 (local image only).
@injectable
class OnboardingProfilePhotoBloc
    extends Bloc<OnboardingProfilePhotoEvent, OnboardingProfilePhotoState> {
  /// Creates a [OnboardingProfilePhotoBloc].
  OnboardingProfilePhotoBloc()
      : _imagePicker = ImagePicker(),
        super(const OnboardingProfilePhotoState()) {
    on<_EventFetched>(_onFetched);
    on<_EventGallerySelected>(_onGallerySelected);
    on<_EventCameraSelected>(_onCameraSelected);
    on<_EventDeleted>(_onDeleted);
    on<_EventSaved>(_onSaved);
  }

  final ImagePicker _imagePicker;

  void _onFetched(
    _EventFetched event,
    Emitter<OnboardingProfilePhotoState> emit,
  ) {
    emit(
      state.copyWith(
        user: event.userYogaSalaPlus,
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  Future<void> _onGallerySelected(
    _EventGallerySelected event,
    Emitter<OnboardingProfilePhotoState> emit,
  ) async {
    final file = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1024,
      maxHeight: 1024,
      imageQuality: 85,
    );
    if (file == null) return;
    final bytes = await file.readAsBytes();
    emit(
      state.copyWith(
        imageBytes: bytes,
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  Future<void> _onCameraSelected(
    _EventCameraSelected event,
    Emitter<OnboardingProfilePhotoState> emit,
  ) async {
    final file = await _imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1024,
      maxHeight: 1024,
      imageQuality: 85,
    );
    if (file == null) return;
    final bytes = await file.readAsBytes();
    emit(
      state.copyWith(
        imageBytes: bytes,
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void _onDeleted(
    _EventDeleted event,
    Emitter<OnboardingProfilePhotoState> emit,
  ) {
    emit(
      state.copyWith(
        imageBytes: null,
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void _onSaved(
    _EventSaved event,
    Emitter<OnboardingProfilePhotoState> emit,
  ) {
    final user = state.user;
    if (user == null) return;

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    if (state.imageBytes == null) {
      emit(
        state.copyWith(
          user: user.copyWith(clearProfileImageUrl: true),
          status: FormzSubmissionStatus.success,
        ),
      );
      return;
    }

    // TODO(onboarding): upload imageBytes to storage and set profileImageUrl.
    emit(
      state.copyWith(
        user: user.copyWith(
          profileImageUrl: user.profileImageUrl ?? '',
        ),
        status: FormzSubmissionStatus.success,
      ),
    );
  }
}
