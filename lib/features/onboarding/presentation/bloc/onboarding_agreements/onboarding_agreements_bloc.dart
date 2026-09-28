import 'dart:io';

import 'package:enterprise_core/enterprise_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/app/domain/usecases/get_app_data_use_case.dart';
import 'package:yogasala_plus_mobile/features/profile/domain/entities/user_yoga_sala_plus.dart';
import 'package:yogasala_plus_mobile/features/profile/domain/usecases/complete_user_yoga_sala_plus_use_case.dart';

part 'onboarding_agreements_event.dart';
part 'onboarding_agreements_state.dart';
part 'onboarding_agreements_bloc.freezed.dart';

/// Owns KVKK / consent acceptance and profile completion (step 5).
@injectable
class OnboardingAgreementsBloc
    extends Bloc<OnboardingAgreementsEvent, OnboardingAgreementsState> {
  /// Creates a [OnboardingAgreementsBloc].
  OnboardingAgreementsBloc(
    this._completeUserYogaSalaPlusUseCase,
    this._getAppDataUseCase,
  ) : super(const OnboardingAgreementsState()) {
    on<_EventFetched>(_onFetched);
    on<_EventKvkkAgreed>(_onKvkkAgreed);
    on<_EventConsentAgreed>(_onConsentAgreed);
    on<_EventCompleted>(_onCompleted);
  }

  final CompleteUserYogaSalaPlusUseCase _completeUserYogaSalaPlusUseCase;
  final GetAppDataUseCase _getAppDataUseCase;

  Future<void> _onFetched(
    _EventFetched event,
    Emitter<OnboardingAgreementsState> emit,
  ) async {
    emit(
      state.copyWith(
        user: event.userYogaSalaPlus,
        status: FormzSubmissionStatus.inProgress,
        failure: null,
      ),
    );

    final appDataId = Platform.isIOS ? 1 : 2;
    final result = await _getAppDataUseCase(
      GetAppDataParams(appDataId: appDataId),
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          failure: failure,
        ),
      ),
      (appData) {
        final isTr = event.userYogaSalaPlus.languageCode
            .toLowerCase()
            .startsWith('tr');
        emit(
          state.copyWith(
            kvkkText: isTr
                ? (appData.kvkkPrivacyPolicyTr ?? '')
                : (appData.kvkkPrivacyPolicyEn ?? ''),
            consentText: isTr
                ? (appData.userConsentConfirmationFormTr ?? '')
                : (appData.userConsentConfirmationFormEn ?? ''),
            status: FormzSubmissionStatus.initial,
            failure: null,
          ),
        );
      },
    );
  }

  void _onKvkkAgreed(
    _EventKvkkAgreed event,
    Emitter<OnboardingAgreementsState> emit,
  ) {
    emit(state.copyWith(kvkkAgreed: event.agreed));
  }

  void _onConsentAgreed(
    _EventConsentAgreed event,
    Emitter<OnboardingAgreementsState> emit,
  ) {
    emit(state.copyWith(consentAgreed: event.agreed));
  }

  Future<void> _onCompleted(
    _EventCompleted event,
    Emitter<OnboardingAgreementsState> emit,
  ) async {
    final user = state.user;
    if (user == null || !state.isValid) return;

    emit(
      state.copyWith(
        status: FormzSubmissionStatus.inProgress,
        failure: null,
      ),
    );

    final result = await _completeUserYogaSalaPlusUseCase(
      CompletUserYogaSalaPlusParams(
        userYogaSalaPlus: user.copyWith(profileCompleted: true),
      ),
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          failure: failure,
        ),
      ),
      (completedUser) => emit(
        state.copyWith(
          user: completedUser,
          status: FormzSubmissionStatus.success,
          failure: null,
        ),
      ),
    );
  }
}
