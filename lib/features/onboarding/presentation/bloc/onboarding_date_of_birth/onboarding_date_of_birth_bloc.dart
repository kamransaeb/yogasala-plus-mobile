import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/profile/domain/entities/user_yoga_sala_plus.dart';

part 'onboarding_date_of_birth_event.dart';
part 'onboarding_date_of_birth_state.dart';
part 'onboarding_date_of_birth_bloc.freezed.dart';

/// Owns birth-date selection for onboarding step 2.
@injectable
class OnboardingDateOfBirthBloc
    extends Bloc<OnboardingDateOfBirthEvent, OnboardingDateOfBirthState> {
  /// Creates a [OnboardingDateOfBirthBloc].
  OnboardingDateOfBirthBloc()
    : super(
        OnboardingDateOfBirthState(
          dateOfBirth: DateTime(DateTime.now().year - 20, 6, 15),
        ),
      ) {
    on<_EventFetched>(_onFetched);
    on<_EventDateOfBirthChanged>(_onDateOfBirthChanged);
  }

  void _onFetched(_EventFetched event, Emitter<OnboardingDateOfBirthState> emit) {
    final existing = event.userYogaSalaPlus.dateOfBirth;
    emit(
      state.copyWith(
        user: event.userYogaSalaPlus,
        dateOfBirth: existing ?? state.dateOfBirth,
      ),
    );
  }

  void _onDateOfBirthChanged(
    _EventDateOfBirthChanged event,
    Emitter<OnboardingDateOfBirthState> emit,
  ) {
    emit(state.copyWith(dateOfBirth: event.dateOfBirth));
  }
}
