part of 'sign_up_bloc.dart';

/// Events for [SignUpBloc].
@freezed
abstract class SignUpEvent with _$SignUpEvent {
  /// Email field changed.
  const factory SignUpEvent.emailChanged(String email) = _EventEmailChanged;

  /// Password field changed.
  const factory SignUpEvent.passwordChanged(String password) =
      _EventPasswordChanged;

  /// Confirm-password field changed.
  const factory SignUpEvent.confirmedPasswordChanged(String confirmedPassword) =
      _EventConfirmedPasswordChanged;

  /// Form submitted.
  const factory SignUpEvent.submitted() = _EventSubmitted;

  /// Reset form to initial state.
  const factory SignUpEvent.reset() = _EventReset;

  /// Auth/sign-up failed — keep field values, clear submission status.
  const factory SignUpEvent.authFailed() = _EventAuthFailed;
}
