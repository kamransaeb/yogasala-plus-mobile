part of 'app_bloc.dart';

/// Events for [AppBloc].
@freezed
abstract class AppEvent with _$AppEvent {
  /// Restore locale and first-use flags from local storage.
  const factory AppEvent.loaded() = _EventLoaded;

  /// Mark first-use onboarding as completed.
  const factory AppEvent.firstUseDisabled() = _EventFirstUseDisabled;

  /// Persist and apply a new UI [locale] language code (`en` / `tr`).
  const factory AppEvent.localeChanged({
    required String locale,
  }) = _EventLocaleChanged;
}
