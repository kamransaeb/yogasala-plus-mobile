part of 'app_bloc.dart';

/// States for [AppBloc] (locale + first-use; AppData lives in AppDirectorBloc).
@freezed
abstract class AppState with _$AppState {
  /// App settings snapshot.
  const factory AppState({
    @Default(true) bool isFirstUse,
    @Default('en') String locale,
  }) = _AppState;

  const AppState._();
}
