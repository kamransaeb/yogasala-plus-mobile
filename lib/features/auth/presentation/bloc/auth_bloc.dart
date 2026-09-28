import 'package:enterprise_core/enterprise_core.dart';
import 'package:enterprise_logger/enterprise_logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/auth/domain/entities/auth_user.dart';
import 'package:yogasala_plus_mobile/features/auth/domain/usecases/check_auth_status_usecase.dart';
import 'package:yogasala_plus_mobile/features/auth/domain/usecases/login_usecase.dart';
import 'package:yogasala_plus_mobile/features/auth/domain/usecases/logout_usecase.dart';
import 'package:yogasala_plus_mobile/features/auth/domain/usecases/reset_password_use_case.dart';
import 'package:yogasala_plus_mobile/features/auth/domain/usecases/sign_up_use_case.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

/// Owns auth session: check status, login, sign-up, reset password, logout.
@lazySingleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  /// Creates a new [AuthBloc] instance.
  AuthBloc(
    this._loginUseCase,
    this._signUpUseCase,
    this._resetPasswordUseCase,
    this._logoutUseCase,
    this._checkAuthStatusUseCase,
    this._logger,
  ) : super(const AuthState.initial()) {
    on<_EventCheckStatusRequested>(_onCheckStatusRequested);
    on<_EventLoginRequested>(_onLoginRequested);
    on<_EventSignUpRequested>(_onSignUpRequested);
    on<_EventResetPasswordRequested>(_onResetPasswordRequested);
    on<_EventLogoutRequested>(_onLogoutRequested);
  }

  final CheckAuthStatusUseCase _checkAuthStatusUseCase;
  final LoginUseCase _loginUseCase;
  final SignUpUseCase _signUpUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;
  final LogoutUseCase _logoutUseCase;
  final LoggerService _logger;

  Future<void> _onCheckStatusRequested(
    _EventCheckStatusRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.checking());
    try {
      final result = await _checkAuthStatusUseCase(const NoParams());
      result.fold(
        (failure) => emit(AuthState.failure(failure: failure)),
        (authUser) {
          if (authUser == null) {
            emit(const AuthState.unauthenticated());
          } else {
            emit(AuthState.authenticated(authUser: authUser));
          }
        },
      );
    } on Object catch (e, stackTrace) {
      _logger.e('Error checking auth status', error: e, stackTrace: stackTrace);
      emit(const AuthState.unauthenticated());
    }
  }

  Future<void> _onLoginRequested(
    _EventLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    final result = await _loginUseCase(
      LoginParams(email: event.email, password: event.password),
    );
    result.fold(
      (failure) => emit(AuthState.failure(failure: failure)),
      (authUser) => emit(AuthState.authenticated(authUser: authUser)),
    );
  }

  Future<void> _onSignUpRequested(
    _EventSignUpRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    final signUpResult = await _signUpUseCase(
      SignUpUseCaseParams(email: event.email, password: event.password),
    );
    signUpResult.fold(
      (failure) => emit(AuthState.signUpFailure(failure: failure)),
      (_) => emit(
        AuthState.signUpSuccess(
          email: event.email,
          password: event.password,
        ),
      ),
    );
  }

  Future<void> _onResetPasswordRequested(
    _EventResetPasswordRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    final result = await _resetPasswordUseCase(
      ResetPasswordUseCaseParams(email: event.email),
    );
    result.fold(
      (failure) => emit(AuthState.resetPasswordFailure(failure: failure)),
      (_) => emit(AuthState.resetPasswordSuccess(email: event.email)),
    );
  }

  Future<void> _onLogoutRequested(
    _EventLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    final result = await _logoutUseCase(const NoParams());
    result.fold(
      (failure) => emit(AuthState.failure(failure: failure)),
      (_) => emit(const AuthState.unauthenticated()),
    );
  }
}
