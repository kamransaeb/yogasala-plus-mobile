part of 'paywall_bloc.dart';

/// States for [PaywallBloc].
@freezed
abstract class PaywallState with _$PaywallState {
  const PaywallState._();

  /// Before first fetch.
  const factory PaywallState.initial() = _StateInitial;

  /// Packages loading.
  const factory PaywallState.loading() = _StateLoading;

  /// Packages ready (purchase / restore may be in flight).
  const factory PaywallState.success({
    @Default(<SubscriptionPackage>[]) List<SubscriptionPackage> packages,
    SubscriptionPlan? highlightPlan,
    @Default(false) bool isPurchasing,
    @Default(false) bool isRestoring,
    @Default(false) bool purchaseCompleted,
    @Default(false) bool restoreCompleted,
    Failure? actionFailure,
  }) = _StateSuccess;

  /// Packages load failed.
  const factory PaywallState.failure({
    required Failure failure,
  }) = _StateFailure;

  /// Whether packages are loading.
  bool get isLoading => maybeMap(loading: (_) => true, orElse: () => false);

  /// Whether packages loaded.
  bool get isSuccess => maybeMap(success: (_) => true, orElse: () => false);

  /// Whether packages load failed.
  bool get isFailure => maybeMap(failure: (_) => true, orElse: () => false);

  /// Whether a purchase is in flight.
  bool get isPurchasing => maybeMap(
        success: (s) => s.isPurchasing,
        orElse: () => false,
      );

  /// Whether restore is in flight.
  bool get isRestoring => maybeMap(
        success: (s) => s.isRestoring,
        orElse: () => false,
      );

  /// Failure when in failure state.
  Failure? get failureOrNull => maybeMap(
        failure: (s) => s.failure,
        orElse: () => null,
      );

  /// Action failure when success (for flushbar).
  Failure? get actionFailureOrNull => maybeMap(
        success: (s) => s.actionFailure,
        orElse: () => null,
      );

  /// Packages when success.
  List<SubscriptionPackage> get packagesOrEmpty => maybeMap(
        success: (s) => s.packages,
        orElse: () => const [],
      );

  /// Highlight plan when success.
  SubscriptionPlan? get highlightPlanOrNull => maybeMap(
        success: (s) => s.highlightPlan,
        orElse: () => null,
      );

  /// Whether purchase completed.
  bool get purchaseCompleted => maybeMap(
        success: (s) => s.purchaseCompleted,
        orElse: () => false,
      );

  /// Whether restore completed.
  bool get restoreCompleted => maybeMap(
        success: (s) => s.restoreCompleted,
        orElse: () => false,
      );
}
