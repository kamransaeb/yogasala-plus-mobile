import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:enterprise_storage/enterprise_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/core/constants/di_constants.dart';
import 'package:yogasala_plus_mobile/core/constants/storage_constants.dart';

part 'privacy_policy_event.dart';
part 'privacy_policy_state.dart';
part 'privacy_policy_bloc.freezed.dart';

/// Loads cached KVKK privacy policy texts from LocalStorage.
@injectable
class PrivacyPolicyBloc extends Bloc<PrivacyPolicyEvent, PrivacyPolicyState> {
  /// Creates a [PrivacyPolicyBloc].
  PrivacyPolicyBloc(
    @Named(DiConstants.sharedPrefs) this._prefs,
  ) : super(const PrivacyPolicyState.initial()) {
    on<_EventFetched>(_onFetched, transformer: restartable());
  }

  final LocalStorage _prefs;

  Future<void> _onFetched(
    _EventFetched event,
    Emitter<PrivacyPolicyState> emit,
  ) async {
    emit(const PrivacyPolicyState.loading());

    final textEn =
        await _prefs.read<String>(StorageConstants.kvkkPrivacyPolicyEn) ?? '';
    final textTr =
        await _prefs.read<String>(StorageConstants.kvkkPrivacyPolicyTr) ?? '';

    if (emit.isDone) return;

    emit(
      PrivacyPolicyState.success(
        textEn: textEn,
        textTr: textTr,
      ),
    );
  }
}
