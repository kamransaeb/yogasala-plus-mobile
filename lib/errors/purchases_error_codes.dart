/// App-owned purchases / RevenueCat sentinel codes the UI branches on.
///
/// Values match localization keys. Not a mirror of `PurchasesErrorCode`.
abstract final class PurchasesErrorCodes {
  const PurchasesErrorCodes._();

  /// User dismissed the store purchase sheet.
  static const String purchaseCancelled = 'purchase_cancelled';

  /// RevenueCat SDK key missing or configure never succeeded.
  static const String purchasesNotConfigured = 'purchases_not_configured';

  /// Purchase / restore failed for a non-cancel reason.
  static const String purchaseFailed = 'purchase_failed';

  /// No current RevenueCat offering (or it has zero packages).
  static const String offeringNotFound = 'purchases_offering_not_found';

  /// Offering packages exist but none map to STANDARD / PREMIUM.
  static const String packagesNotFound = 'purchases_packages_not_found';

  /// A specific package id was missing when purchasing.
  static const String packageNotFound = 'purchases_package_not_found';
}
