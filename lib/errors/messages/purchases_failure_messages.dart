import 'package:enterprise_core/enterprise_core.dart';
import 'package:yogasala_plus_mobile/errors/messages/message_utils.dart';
import 'package:yogasala_plus_mobile/errors/purchases_error_codes.dart';

/// Localized message for app-owned purchases codes, or null.
String? purchasesFailureMessage(Failure failure) {
  final code = failure.code?.toLowerCase();
  if (code == null || code.isEmpty) return null;

  const known = {
    PurchasesErrorCodes.purchaseCancelled,
    PurchasesErrorCodes.purchasesNotConfigured,
    PurchasesErrorCodes.purchaseFailed,
    PurchasesErrorCodes.offeringNotFound,
    PurchasesErrorCodes.packagesNotFound,
    PurchasesErrorCodes.packageNotFound,
  };
  if (!known.contains(code)) return null;

  return translatedOr(code, 'purchase_failed');
}
