import 'dart:typed_data';

import 'package:enterprise_core/enterprise_core.dart';
import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/profile/domain/entities/user_yoga_sala_plus.dart';
import 'package:yogasala_plus_mobile/features/profile/domain/use_cases/update_user_yoga_sala_plus_mobile_user_use_case.dart';
import 'package:yogasala_plus_mobile/features/profile/domain/use_cases/upload_profile_image_use_case.dart';

part 'profile_info_event.dart';
part 'profile_info_state.dart';
part 'profile_info_bloc.freezed.dart';

/// Owns editing and saving profile info (fields + photo) in one flow.
@injectable
class ProfileInfoBloc extends Bloc<ProfileInfoEvent, ProfileInfoState> {
  /// Creates a [ProfileInfoBloc].
  ProfileInfoBloc(this._uploadProfileImage, this._updateUser)
    : _imagePicker = ImagePicker(),
      super(
        ProfileInfoState(
          dateOfBirth: DateTime(DateTime.now().year - 20, 6, 15),
        ),
      ) {
    on<_EventFetched>(_onFetched);
    on<_EventNameChanged>(_onNameChanged);
    on<_EventSurnameChanged>(_onSurnameChanged);
    on<_EventDateOfBirthChanged>(_onDateOfBirthChanged);
    on<_EventGenderChanged>(_onGenderChanged);
    on<_EventGallerySelected>(_onGallerySelected);
    on<_EventCameraSelected>(_onCameraSelected);
    on<_EventPhotoDeleted>(_onPhotoDeleted);
    on<_EventSaved>(_onSaved);
  }

  final UploadProfileImageUseCase _uploadProfileImage;
  final UpdateUserYogaSalaPlusMobileUserUseCase _updateUser;
  final ImagePicker _imagePicker;

  void _onFetched(
    _EventFetched event,
    Emitter<ProfileInfoState> emit,
  ) {
    final user = event.userYogaSalaPlus;
    final name = user.name ?? '';
    final surname = user.surname ?? '';
    emit(
      state.copyWith(
        user: user,
        nameInput: name.isNotEmpty
            ? NameValidator.dirty(name)
            : const NameValidator.pure(),
        surnameInput: surname.isNotEmpty
            ? NameValidator.dirty(surname)
            : const NameValidator.pure(),
        dateOfBirth: user.dateOfBirth ?? state.dateOfBirth,
        gender: user.gender ?? -1,
        imageBytes: null,
        removedExisting: false,
        status: FormzSubmissionStatus.initial,
        failure: null,
      ),
    );
  }

  void _onNameChanged(
    _EventNameChanged event,
    Emitter<ProfileInfoState> emit,
  ) {
    emit(state.copyWith(nameInput: NameValidator.dirty(event.name)));
  }

  void _onSurnameChanged(
    _EventSurnameChanged event,
    Emitter<ProfileInfoState> emit,
  ) {
    emit(state.copyWith(surnameInput: NameValidator.dirty(event.surname)));
  }

  void _onDateOfBirthChanged(
    _EventDateOfBirthChanged event,
    Emitter<ProfileInfoState> emit,
  ) {
    emit(state.copyWith(dateOfBirth: event.dateOfBirth));
  }

  void _onGenderChanged(
    _EventGenderChanged event,
    Emitter<ProfileInfoState> emit,
  ) {
    emit(state.copyWith(gender: event.gender));
  }

  Future<void> _onGallerySelected(
    _EventGallerySelected event,
    Emitter<ProfileInfoState> emit,
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
        removedExisting: false,
        status: FormzSubmissionStatus.initial,
        failure: null,
      ),
    );
  }

  Future<void> _onCameraSelected(
    _EventCameraSelected event,
    Emitter<ProfileInfoState> emit,
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
        removedExisting: false,
        status: FormzSubmissionStatus.initial,
        failure: null,
      ),
    );
  }

  void _onPhotoDeleted(
    _EventPhotoDeleted event,
    Emitter<ProfileInfoState> emit,
  ) {
    emit(
      state.copyWith(
        imageBytes: null,
        removedExisting: true,
        status: FormzSubmissionStatus.initial,
        failure: null,
      ),
    );
  }

  Future<void> _onSaved(
    _EventSaved event,
    Emitter<ProfileInfoState> emit,
  ) async {
    final user = state.user;
    if (user == null || !state.isValid) return;

    emit(
      state.copyWith(
        status: FormzSubmissionStatus.inProgress,
        failure: null,
      ),
    );

    var updatedUser = user.copyWith(
      name: state.nameInput.value.trim(),
      surname: state.surnameInput.value.trim(),
      dateOfBirth: state.dateOfBirth,
      gender: state.gender,
    );

    final bytes = state.imageBytes;
    if (bytes != null) {
      const fileName = 'profile.jpg';
      final contentType =
          UploadProfileImageUseCase.contentTypeFor(fileName: fileName) ??
          'image/jpeg';
      final uploadResult = await _uploadProfileImage(
        UploadProfileImageParams(
          bytes: bytes,
          fileName: fileName,
          contentType: contentType,
        ),
      );
      if (emit.isDone) return;

      final url = uploadResult.fold<String?>(
        (failure) {
          emit(
            state.copyWith(
              status: FormzSubmissionStatus.failure,
              failure: failure,
            ),
          );
          return null;
        },
        (value) => value,
      );
      if (url == null) return;
      updatedUser = updatedUser.copyWith(profileImageUrl: url);
    } else if (state.removedExisting) {
      updatedUser = updatedUser.copyWith(clearProfileImageUrl: true);
    }

    final result = await _updateUser(
      UpdateUserYogaSalaPlusMobileUserParams(userYogaSalaPlus: updatedUser),
    );

    if (emit.isDone) return;

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          failure: failure,
        ),
      ),
      (saved) => emit(
        state.copyWith(
          user: saved,
          imageBytes: null,
          removedExisting: false,
          status: FormzSubmissionStatus.success,
          failure: null,
        ),
      ),
    );
  }
}
