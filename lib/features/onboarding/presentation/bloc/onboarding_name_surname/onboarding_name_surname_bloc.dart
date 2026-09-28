import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/profile/domain/entities/user_yoga_sala_plus.dart';

part 'onboarding_name_surname_event.dart';
part 'onboarding_name_surname_state.dart';
part 'onboarding_name_surname_bloc.freezed.dart';

/// Owns name / surname validation for onboarding step 1.
@injectable
class OnboardingNameSurnameBloc
    extends Bloc<OnboardingNameSurnameEvent, OnboardingNameSurnameState> {
  /// Creates a [OnboardingNameSurnameBloc].
  OnboardingNameSurnameBloc() : super(const OnboardingNameSurnameState()) {
    on<_EventFetched>(_onFetched);
    on<_EventNameChanged>(_onNameChanged);
    on<_EventSurnameChanged>(_onSurnameChanged);
  }

  void _onFetched(
    _EventFetched event,
    Emitter<OnboardingNameSurnameState> emit,
  ) {
    final name = event.userYogaSalaPlus.name ?? '';
    final surname = event.userYogaSalaPlus.surname ?? '';
    emit(
      state.copyWith(
        user: event.userYogaSalaPlus,
        nameInput: name.isNotEmpty
            ? NameValidator.dirty(name)
            : const NameValidator.pure(),
        surnameInput: surname.isNotEmpty
            ? NameValidator.dirty(surname)
            : const NameValidator.pure(),
      ),
    );
  }

  void _onNameChanged(
    _EventNameChanged event,
    Emitter<OnboardingNameSurnameState> emit,
  ) {
    emit(state.copyWith(nameInput: NameValidator.dirty(event.name)));
  }

  void _onSurnameChanged(
    _EventSurnameChanged event,
    Emitter<OnboardingNameSurnameState> emit,
  ) {
    emit(state.copyWith(surnameInput: NameValidator.dirty(event.surname)));
  }
}
