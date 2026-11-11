import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:yogasala_plus_mobile/errors/messages/message_utils.dart';

/// Message for auth, validation, payment and business-rule failures, or null
/// when [failure] is none of these.
String? businessFailureMessage(Failure failure) => switch (failure) {
  // The message is often a localization key (e.g. user_not_authenticated).
  UnauthorizedAccessFailure(:final message) =>
    translatedOr(message, 'unauthorized_error'),
  InvalidCredentialsFailure() => 'invalid_credentials_error'.tr(),
  EmailNotVerifiedFailure() => 'email_not_verified_error'.tr(),
  AccountLockedFailure(:final remainingTime) => 'account_locked_error'.tr(
    args: ['${remainingTime.inMinutes}'],
  ),
  AccountDisabledFailure() => 'account_disabled_error'.tr(),

  // FormValidationFailure must precede the ValidationFailure fallbacks.
  FormValidationFailure() => 'form_validation_error'.tr(),
  ValidationFailure(:final field?, rule: != null, :final message) =>
    'field_validation_error'.tr(args: [field, message]),
  ValidationFailure(:final message) => message,

  PaymentDeclinedFailure(:final declineReason?) =>
    'payment_declined_reason_error'.tr(args: [declineReason]),
  PaymentDeclinedFailure() => 'payment_declined_error'.tr(),
  InsufficientFundsFailure() => 'insufficient_funds_error'.tr(),

  NotFoundFailure() => 'resource_not_found_error'.tr(),
  AlreadyExistsFailure() => 'resource_already_exists_error'.tr(),
  OperationNotAllowedFailure() => 'operation_not_allowed_error'.tr(),
  _ => null,
};
