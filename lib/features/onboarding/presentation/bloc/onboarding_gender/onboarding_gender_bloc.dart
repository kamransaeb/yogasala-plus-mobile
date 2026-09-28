import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/profile/domain/entities/user_yoga_sala_plus.dart';

part 'onboarding_gender_event.dart';
part 'onboarding_gender_state.dart';
part 'onboarding_gender_bloc.freezed.dart';

/// Owns gender selection for onboarding step 3.
///
/// Gender values: `-1` none, `0` male, `1` female, `2` not shared.
@injectable
class OnboardingGenderBloc extends Bloc<OnboardingGenderEvent, OnboardingGenderState> {
  /// Creates a [OnboardingGenderBloc].
  OnboardingGenderBloc() : super(const OnboardingGenderState()) {
    on<_EventFetched>(_onFetched);
    on<_EventGenderChanged>(_onGenderChanged);
  }

  void _onFetched(_EventFetched event, Emitter<OnboardingGenderState> emit) {
    emit(
      state.copyWith(
        user: event.userYogaSalaPlus,
        gender: event.userYogaSalaPlus.gender ?? -1,
      ),
    );
  }

  void _onGenderChanged(
    _EventGenderChanged event,
    Emitter<OnboardingGenderState> emit,
  ) {
    emit(state.copyWith(gender: event.gender));
  }
}
