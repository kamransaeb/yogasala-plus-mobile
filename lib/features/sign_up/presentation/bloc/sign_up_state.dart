part of 'sign_up_bloc.dart';

/// State for [SignUpBloc].
@freezed
abstract class SignUpState with _$SignUpState {
  /// Creates a [SignUpState].
  const factory SignUpState({
    @Default(UserEmailValidator.pure()) UserEmailValidator email,
    @Default(UserPasswordValidator.pure()) UserPasswordValidator password,
    @Default(ConfirmedPasswordValidator.pure())
    ConfirmedPasswordValidator confirmedPassword,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
  }) = _SignUpState;

  const SignUpState._();

  /// Whether the sign-up form is valid.
  bool get isValid => Formz.validate([email, password, confirmedPassword]);

  /// Whether to show validation errors after a failed submit.
  bool get showErrors => status == FormzSubmissionStatus.failure;
}
