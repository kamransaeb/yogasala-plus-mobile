import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';
part 'reset_password_bloc.freezed.dart';

/// Form validation for the reset-password screen.
@injectable
class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  /// Creates a [ResetPasswordBloc].
  ResetPasswordBloc() : super(const ResetPasswordState()) {
    on<_EventEmailChanged>(_onEmailChanged);
    on<_EventSubmitted>(_onSubmitted);
    on<_EventReset>(_onReset);
    on<_EventAuthFailed>(_onAuthFailed);
  }

  void _onAuthFailed(_EventAuthFailed event, Emitter<ResetPasswordState> emit) {
    emit(state.copyWith(status: FormzSubmissionStatus.initial));
  }

  void _onEmailChanged(
    _EventEmailChanged event,
    Emitter<ResetPasswordState> emit,
  ) {
    emit(
      state.copyWith(
        email: UserEmailValidator.dirty(event.email),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void _onSubmitted(
    _EventSubmitted event,
    Emitter<ResetPasswordState> emit,
  ) {
    final email = UserEmailValidator.dirty(state.email.value);

    emit(state.copyWith(email: email));

    if (!Formz.validate([email])) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
      return;
    }

    emit(state.copyWith(status: FormzSubmissionStatus.success));
  }

  void _onReset(_EventReset event, Emitter<ResetPasswordState> emit) {
    emit(const ResetPasswordState());
  }
}
