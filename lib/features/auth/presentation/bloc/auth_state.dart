part of 'auth_bloc.dart';

/// The states for the authentication feature.
@freezed
abstract class AuthState with _$AuthState {
  const AuthState._();

  /// The initial state of the auth bloc.
  const factory AuthState.initial() = _StateInitial;

  /// The state of the auth bloc when checking the status of the user.
  const factory AuthState.checking() = _StateChecking;

  /// The state of the auth bloc when loading the user.
  const factory AuthState.loading() = _StateLoading;

  /// The state of the auth bloc when the user is authenticated.
  const factory AuthState.authenticated({required AuthUser authUser}) =
      _StateAuthenticated;

  /// The state of the auth bloc when the user is unauthenticated.
  const factory AuthState.unauthenticated() = _StateUnauthenticated;

  /// The state of the auth bloc when the user is failed to authenticate.
  const factory AuthState.failure({required Failure failure}) = _StateFailure;

  /// Sign-up succeeded; session is not established (user must log in).
  const factory AuthState.signUpSuccess({
    required String email,
    required String password,
  }) = _StateSignUpSuccess;

  /// Sign-up failed.
  const factory AuthState.signUpFailure({required Failure failure}) =
      _StateSignUpFailure;

  /// Password-reset email sent successfully.
  const factory AuthState.resetPasswordSuccess({required String email}) =
      _StateResetPasswordSuccess;

  /// Password-reset request failed.
  const factory AuthState.resetPasswordFailure({required Failure failure}) =
      _StateResetPasswordFailure;

  /// Whether the auth bloc is loading.
  bool get isLoading => maybeWhen(
    loading: () => true,
    checking: () => true,
    orElse: () => false,
  );

  /// The user of the auth bloc.
  AuthUser? get user => maybeWhen(
    authenticated: (user) => user,
    orElse: () => null,
  );

  /// Whether the auth bloc is authenticated.
  bool get isAuthenticated => maybeWhen(
    authenticated: (_) => true,
    orElse: () => false,
  );

  /// Whether the auth bloc is checking.
  bool get isChecking => maybeWhen(
    checking: () => true,
    orElse: () => false,
  );

  /// Whether session restore finished with a yes/no auth decision.
  ///
  /// `failure` / sign-up terminal states count so AuthGuard does not hang.
  bool get hasAuthDecision => maybeMap(
    authenticated: (_) => true,
    unauthenticated: (_) => true,
    failure: (_) => true,
    signUpSuccess: (_) => true,
    signUpFailure: (_) => true,
    resetPasswordSuccess: (_) => true,
    resetPasswordFailure: (_) => true,
    orElse: () => false,
  );
}
