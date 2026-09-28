part of 'app_director_bloc.dart';

/// States for the [AppDirectorBloc].
@freezed
abstract class AppDirectorState with _$AppDirectorState {
  const AppDirectorState._();

  /// Before bootstrap / routing decisions start.
  const factory AppDirectorState.initial({
    @Default(true) bool isFirstLaunch,
    @Default(true) bool isAppUpdate,
    @Default('') String storeUrlEn,
    @Default('') String storeUrlTr,
  }) = _StateInitial;

  /// Director work in progress.
  const factory AppDirectorState.loading({
    @Default(true) bool isFirstLaunch,
    @Default(true) bool isAppUpdate,
    @Default('') String storeUrlEn,
    @Default('') String storeUrlTr,
    UserYogaSalaPlus? userYogaSalaPlus,
  }) = _StateLoading;

  /// Force-update required; store URLs are available for the dialog.
  const factory AppDirectorState.updateRequired({
    @Default(true) bool isFirstLaunch,
    @Default('') String storeUrlEn,
    @Default('') String storeUrlTr,
  }) = _StateUpdateRequired;

  /// Ready to route (home / profile).
  const factory AppDirectorState.success({
    required UserYogaSalaPlus userYogaSalaPlus,
    @Default(true) bool isFirstLaunch,
    @Default(true) bool isAppUpdate,
    @Default('') String storeUrlEn,
    @Default('') String storeUrlTr,
  }) = _StateSuccess;

  /// Bootstrap failed.
  const factory AppDirectorState.failure({
    required Failure failure,
    @Default(true) bool isFirstLaunch,
    @Default(true) bool isAppUpdate,
    @Default('') String storeUrlEn,
    @Default('') String storeUrlTr,
    UserYogaSalaPlus? userYogaSalaPlus,
  }) = _StateFailure;

  /// Whether a busy state that should block UI actions.
  bool get isLoading => maybeMap(
    loading: (_) => true,
    orElse: () => false,
  );

  /// Whether the app director has succeeded.
  bool get isSuccess => maybeMap(
    success: (_) => true,
    orElse: () => false,
  );

  /// Whether force-update UI should be shown.
  bool get isUpdateRequired => maybeMap(
    updateRequired: (_) => true,
    orElse: () => false,
  );

  /// Whether the app director has failed.
  bool get isFailure => maybeMap(
    failure: (_) => true,
    orElse: () => false,
  );

  /// Failure payload when this state is a failure variant; otherwise null.
  Failure? get failureOrNull => maybeMap(
    failure: (state) => state.failure,
    orElse: () => null,
  );

  /// First-use flag from the current variant.
  @override
  bool get isFirstLaunch => maybeMap(
    initial: (s) => s.isFirstLaunch,
    loading: (s) => s.isFirstLaunch,
    updateRequired: (s) => s.isFirstLaunch,
    success: (s) => s.isFirstLaunch,
    failure: (s) => s.isFirstLaunch,
    orElse: () => true,
  );

  /// `true` when install is allowed; `false` when force-update is required.
  bool get isAppUpdate => maybeMap(
    initial: (s) => s.isAppUpdate,
    loading: (s) => s.isAppUpdate,
    updateRequired: (_) => false,
    success: (s) => s.isAppUpdate,
    failure: (s) => s.isAppUpdate,
    orElse: () => true,
  );

  /// EN store URL from the current variant.
  @override
  String get storeUrlEn => maybeMap(
    initial: (s) => s.storeUrlEn,
    loading: (s) => s.storeUrlEn,
    updateRequired: (s) => s.storeUrlEn,
    success: (s) => s.storeUrlEn,
    failure: (s) => s.storeUrlEn,
    orElse: () => '',
  );

  /// TR store URL from the current variant.
  @override
  String get storeUrlTr => maybeMap(
    initial: (s) => s.storeUrlTr,
    loading: (s) => s.storeUrlTr,
    updateRequired: (s) => s.storeUrlTr,
    success: (s) => s.storeUrlTr,
    failure: (s) => s.storeUrlTr,
    orElse: () => '',
  );
}
