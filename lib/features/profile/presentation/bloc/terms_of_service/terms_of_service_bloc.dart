import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:enterprise_storage/enterprise_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/core/constants/di_constants.dart';
import 'package:yogasala_plus_mobile/core/constants/storage_constants.dart';

part 'terms_of_service_event.dart';
part 'terms_of_service_state.dart';
part 'terms_of_service_bloc.freezed.dart';

/// Loads cached user consent / terms texts from LocalStorage.
@injectable
class TermsOfServiceBloc
    extends Bloc<TermsOfServiceEvent, TermsOfServiceState> {
  /// Creates a [TermsOfServiceBloc].
  TermsOfServiceBloc(
    @Named(DiConstants.sharedPrefs) this._prefs,
  ) : super(const TermsOfServiceState.initial()) {
    on<_EventFetched>(_onFetched, transformer: restartable());
  }

  final LocalStorage _prefs;

  Future<void> _onFetched(
    _EventFetched event,
    Emitter<TermsOfServiceState> emit,
  ) async {
    emit(const TermsOfServiceState.loading());

    final textEn =
        await _prefs.read<String>(
          StorageConstants.userConsentConfirmationFormEn,
        ) ??
        '';
    final textTr =
        await _prefs.read<String>(
          StorageConstants.userConsentConfirmationFormTr,
        ) ??
        '';

    if (emit.isDone) return;

    emit(
      TermsOfServiceState.success(
        textEn: textEn,
        textTr: textTr,
      ),
    );
  }
}
