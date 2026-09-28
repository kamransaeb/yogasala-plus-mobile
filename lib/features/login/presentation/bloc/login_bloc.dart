import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

/// The login bloc.
@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  /// Creates a [LoginBloc], optionally pre-filled with [email] / [password].
  LoginBloc({
    @factoryParam String? email,
    @factoryParam String? password,
  }) : super(
         LoginState(
           email: email != null && email.isNotEmpty
               ? UserEmailValidator.dirty(email)
               : const UserEmailValidator.pure(),
           password: password != null && password.isNotEmpty
               ? UserPasswordValidator.dirty(password)
               : const UserPasswordValidator.pure(),
         ),
       ) {
    on<_EventEmailChanged>(_onEmailChanged);
    on<_EventPasswordChanged>(_onPasswordChanged);
    on<_EventSubmitted>(_onSubmitted);
    on<_EventReset>(_onReset);
    on<_EventAuthFailed>(_onAuthFailed);
  }

  void _onAuthFailed(_EventAuthFailed event, Emitter<LoginState> emit) {
    emit(state.copyWith(status: FormzSubmissionStatus.initial));
  }

  void _onEmailChanged(_EventEmailChanged event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(
        email: UserEmailValidator.dirty(event.email),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void _onPasswordChanged(
    _EventPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(
      state.copyWith(
        password: UserPasswordValidator.dirty(event.password),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void _onSubmitted(_EventSubmitted event, Emitter<LoginState> emit) {
    final email = UserEmailValidator.dirty(state.email.value);
    final password = UserPasswordValidator.dirty(state.password.value);

    emit(state.copyWith(email: email, password: password));

    if (!Formz.validate([email, password])) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
      return;
    }

    emit(state.copyWith(status: FormzSubmissionStatus.success));
  }

  void _onReset(_EventReset event, Emitter<LoginState> emit) {
    emit(const LoginState());
  }
}
