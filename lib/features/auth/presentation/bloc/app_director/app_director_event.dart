part of 'app_director_bloc.dart';

/// The event for the login bloc.
@freezed
abstract class AppDirectorEvent with _$AppDirectorEvent {
  /// The event for the email changed.
  const factory AppDirectorEvent.fetched(String email) = _EventFetched;

  /// The event for the password changed.
  const factory AppDirectorEvent.firstUseDisabled(String password) =
      _EventFirstUseDisabled;

  /// Checks whether a valid session exists and loads the current user when it
  /// does.
  // = _EventCheckStatusRequested is Freezed syntax. It tells the generator:
  // “this factory builds the private class _EventCheckStatusRequested.”
  const factory AppDirectorEvent.checkStatusRequested() =
      _EventCheckStatusRequested;

  /// Requests to login the user.
  const factory AppDirectorEvent.loginRequested({
    required String email,
    required String password,
  }) = _EventLoginRequested;

  /// Requests to logout the user.
  const factory AppDirectorEvent.logoutRequested() = _EventLogoutRequested;
}
