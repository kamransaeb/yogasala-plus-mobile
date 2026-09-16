part of 'app_director_bloc.dart';

/// States for the [AppDirectorBloc].
@freezed
abstract class AppDirectorState with _$AppDirectorState {
  const AppDirectorState._();

  /// Before bootstrap / routing decisions start.
  const factory AppDirectorState.initial({
    @Default(true) bool isFirstUse,
    @Default(true) bool isAppUpdate,
    @Default('') String updateAppStoreUrlEn,
    @Default('') String updateAppStoreUrlTr,
  }) = _StateInitial;

  /// The state of the auth bloc when checking the status of the user.
  const factory AppDirectorState.checking() = _StateChecking;

  /// Checking auth / profile / update flags.
  const factory AppDirectorState.loading({
    @Default(true) bool isFirstUse,
    @Default(true) bool isAppUpdate,
    @Default('') String updateAppStoreUrlEn,
    @Default('') String updateAppStoreUrlTr,
    UserYogaSalaPlus? userYogaSalaPlus,
  }) = _StateLoading;

  /// Ready to route (login / home / update, etc.).
  const factory AppDirectorState.success({
    required UserYogaSalaPlus userYogaSalaPlus,
    @Default(true) bool isFirstUse,
    @Default(true) bool isAppUpdate,
    @Default('') String updateAppStoreUrlEn,
    @Default('') String updateAppStoreUrlTr,
  }) = _StateSuccess;

  /// Bootstrap failed.
  const factory AppDirectorState.failure({
    required Failure failure,
    @Default(true) bool isFirstUse,
    @Default(true) bool isAppUpdate,
    @Default('') String updateAppStoreUrlEn,
    @Default('') String updateAppStoreUrlTr,
    UserYogaSalaPlus? userYogaSalaPlus,
  }) = _StateFailure;

  /// The state of the auth bloc when the user is authenticated.
  const factory AppDirectorState.authenticated({required AuthUser authUser}) =
      _StateAuthenticated;

  /// The state of the auth bloc when the user is unauthenticated.
  const factory AppDirectorState.unauthenticated() = _StateUnauthenticated;
}
