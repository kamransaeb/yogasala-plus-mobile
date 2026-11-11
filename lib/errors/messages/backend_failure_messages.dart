import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_core/enterprise_core.dart';

/// Localized message for an API / HTTP failure's backend `code`, or null.
///
/// `ErrorHandler` puts the RFC 7807 `code` in [Failure.code] (e.g.
/// `subscription_required`), falling back to a generic client code when the
/// body has none. Only codes with a same-named localization key win; anything
/// else falls through to the typed mappers.
String? backendFailureMessage(Failure failure) {
  if (failure is! ApiFailure && failure is! HttpStatusFailure) return null;
  final code = failure.code;
  if (code == null || code.isEmpty) return null;
  return _translateCode(code);
}

/// Localization keys are case-sensitive and the backend may send
/// `MISSING_TENANT_ID`, so the raw, lower and upper variants are tried.
String? _translateCode(String code) {
  for (final key in {code, code.toLowerCase(), code.toUpperCase()}) {
    final translated = key.tr();
    if (translated != key) return translated;
  }
  return null;
}
