part of 'reset_password_bloc.dart';

/// State for [ResetPasswordBloc].
@freezed
abstract class ResetPasswordState with _$ResetPasswordState {
  /// Creates a [ResetPasswordState].
  const factory ResetPasswordState({
    @Default(UserEmailValidator.pure()) UserEmailValidator email,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
  }) = _ResetPasswordState;

  const ResetPasswordState._();

  /// Whether the reset-password form is valid.
  bool get isValid => Formz.validate([email]);

  /// Whether to show validation errors after a failed submit.
  bool get showErrors => status == FormzSubmissionStatus.failure;
}
