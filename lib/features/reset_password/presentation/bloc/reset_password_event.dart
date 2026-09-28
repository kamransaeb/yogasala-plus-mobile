part of 'reset_password_bloc.dart';

/// Events for [ResetPasswordBloc].
@freezed
abstract class ResetPasswordEvent with _$ResetPasswordEvent {
  /// Email field changed.
  const factory ResetPasswordEvent.emailChanged(String email) =
      _EventEmailChanged;

  /// Form submitted.
  const factory ResetPasswordEvent.submitted() = _EventSubmitted;

  /// Reset form to initial state.
  const factory ResetPasswordEvent.reset() = _EventReset;

  /// Auth/reset failed — keep field values, clear submission status.
  const factory ResetPasswordEvent.authFailed() = _EventAuthFailed;
}
