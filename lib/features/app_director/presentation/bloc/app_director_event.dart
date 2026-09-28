part of 'app_director_bloc.dart';

/// Events for the [AppDirectorBloc].
@freezed
abstract class AppDirectorEvent with _$AppDirectorEvent {
  const AppDirectorEvent._();

  /// Full bootstrap: AppData → auth → open-mobile profile.
  const factory AppDirectorEvent.loaded() = _EventLoaded;

  /// Marks first-use as completed.
  const factory AppDirectorEvent.firstLaunchDisabled() =
      _EventFirstLaunchDisabled;
}
