part of 'profile_info_bloc.dart';

/// State for [ProfileInfoBloc].
@freezed
abstract class ProfileInfoState with _$ProfileInfoState {
  /// Creates a [ProfileInfoState].
  const factory ProfileInfoState({
    required DateTime dateOfBirth,
    UserYogaSalaPlus? user,
    @Default(NameValidator.pure()) NameValidator nameInput,
    @Default(NameValidator.pure()) NameValidator surnameInput,
    @Default(-1) int gender,
    Uint8List? imageBytes,
    @Default(false) bool removedExisting,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    Failure? failure,
  }) = _ProfileInfoState;

  const ProfileInfoState._();

  /// Whether name and surname are valid and a gender is selected.
  bool get isValid =>
      Formz.validate([nameInput, surnameInput]) && gender != -1;
}
