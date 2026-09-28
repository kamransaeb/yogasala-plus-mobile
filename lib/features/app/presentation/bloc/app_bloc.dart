import 'package:enterprise_logger/enterprise_logger.dart';
import 'package:enterprise_storage/enterprise_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/core/constants/di_constants.dart';
import 'package:yogasala_plus_mobile/core/constants/storage_constants.dart';

part 'app_bloc.freezed.dart';
part 'app_event.dart';
part 'app_state.dart';

/// Owns app-level UI settings: locale and first-use flags.
///
/// Remote AppData / force-update boot is handled by AppDirectorBloc.
@lazySingleton
class AppBloc extends Bloc<AppEvent, AppState> {
  /// Creates an [AppBloc].
  AppBloc(
    this._logger,
    @Named(DiConstants.sharedPrefs) this._prefs,
  ) : super(const AppState()) {
    on<_EventLoaded>(_onLoaded);
    on<_EventFirstUseDisabled>(_onFirstUseDisabled);
    on<_EventLocaleChanged>(_onLocaleChanged);
  }

  final LoggerService _logger;
  final LocalStorage _prefs;

  Future<void> _onLoaded(
    _EventLoaded event,
    Emitter<AppState> emit,
  ) async {
    final locale = await _readSavedLocale();
    final isFirstUse =
        await _prefs.read<bool>(StorageConstants.isFirstLaunch) ?? true;
    _logger.d('AppBloc loaded locale=$locale isFirstUse=$isFirstUse');
    emit(state.copyWith(locale: locale, isFirstUse: isFirstUse));
  }

  Future<void> _onLocaleChanged(
    _EventLocaleChanged event,
    Emitter<AppState> emit,
  ) async {
    final next = _normalizeLocale(event.locale);
    if (next == state.locale) return;

    _logger.d('AppBloc localeChanged $next');
    await _prefs.write(StorageConstants.selectedLocale, next);
    emit(state.copyWith(locale: next));
  }

  Future<void> _onFirstUseDisabled(
    _EventFirstUseDisabled event,
    Emitter<AppState> emit,
  ) async {
    if (!state.isFirstUse) return;

    await _prefs.write(StorageConstants.isFirstLaunch, false);
    emit(state.copyWith(isFirstUse: false));
  }

  Future<String> _readSavedLocale() async {
    final saved = await _prefs.read<String>(StorageConstants.selectedLocale);
    return _normalizeLocale(saved ?? 'en');
  }

  String _normalizeLocale(String value) {
    final code = value.toLowerCase();
    if (code == 'tr' || code.startsWith('tr_')) return 'tr';
    return 'en';
  }
}
