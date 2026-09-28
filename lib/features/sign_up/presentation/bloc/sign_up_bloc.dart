import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';
part 'sign_up_bloc.freezed.dart';

/// Form validation for the sign-up screen.
@injectable
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  /// Creates a [SignUpBloc].
  SignUpBloc() : super(const SignUpState()) {
    on<_EventEmailChanged>(_onEmailChanged);
    on<_EventPasswordChanged>(_onPasswordChanged);
    on<_EventConfirmedPasswordChanged>(_onConfirmedPasswordChanged);
    on<_EventSubmitted>(_onSubmitted);
    on<_EventReset>(_onReset);
    on<_EventAuthFailed>(_onAuthFailed);
  }

  void _onAuthFailed(_EventAuthFailed event, Emitter<SignUpState> emit) {
    emit(state.copyWith(status: FormzSubmissionStatus.initial));
  }

  void _onEmailChanged(_EventEmailChanged event, Emitter<SignUpState> emit) {
    emit(
      state.copyWith(
        email: UserEmailValidator.dirty(event.email),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void _onPasswordChanged(
    _EventPasswordChanged event,
    Emitter<SignUpState> emit,
  ) {
    final password = UserPasswordValidator.dirty(event.password);
    final confirmedPassword = ConfirmedPasswordValidator.dirty(
      originalPassword: password.value,
      value: state.confirmedPassword.value,
    );
    emit(
      state.copyWith(
        password: password,
        confirmedPassword: confirmedPassword,
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void _onConfirmedPasswordChanged(
    _EventConfirmedPasswordChanged event,
    Emitter<SignUpState> emit,
  ) {
    emit(
      state.copyWith(
        confirmedPassword: ConfirmedPasswordValidator.dirty(
          originalPassword: state.password.value,
          value: event.confirmedPassword,
        ),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void _onSubmitted(_EventSubmitted event, Emitter<SignUpState> emit) {
    final email = UserEmailValidator.dirty(state.email.value);
    final password = UserPasswordValidator.dirty(state.password.value);
    final confirmedPassword = ConfirmedPasswordValidator.dirty(
      originalPassword: password.value,
      value: state.confirmedPassword.value,
    );

    emit(
      state.copyWith(
        email: email,
        password: password,
        confirmedPassword: confirmedPassword,
      ),
    );

    if (!Formz.validate([email, password, confirmedPassword])) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
      return;
    }

    emit(state.copyWith(status: FormzSubmissionStatus.success));
  }

  void _onReset(_EventReset event, Emitter<SignUpState> emit) {
    emit(const SignUpState());
  }
}
