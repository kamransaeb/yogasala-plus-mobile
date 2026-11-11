part of 'paywall_bloc.dart';

/// Events for [PaywallBloc].
@freezed
abstract class PaywallEvent with _$PaywallEvent {
  const PaywallEvent._();

  /// Load RevenueCat packages.
  const factory PaywallEvent.fetched({
    SubscriptionPlan? highlightPlan,
  }) = _EventFetched;

  /// Purchase a package by id.
  const factory PaywallEvent.purchaseRequested({
    required String packageId,
  }) = _EventPurchaseRequested;

  /// Restore previous purchases.
  const factory PaywallEvent.restoreRequested() = _EventRestoreRequested;
}
