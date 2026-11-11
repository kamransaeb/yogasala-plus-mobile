import 'package:easy_localization/easy_localization.dart';

/// Translates [key] when it is a localization key, otherwise [fallbackKey].
String translatedOr(String key, String fallbackKey) {
  if (key.isNotEmpty) {
    final translated = key.tr();
    // easy_localization returns the key itself when it is missing.
    if (translated != key) return translated;
  }
  return fallbackKey.tr();
}

/// Human-readable byte size (B / KB / MB / GB).
String formatByteSize(int bytes) {
  const kb = 1024;
  const mb = kb * 1024;
  const gb = mb * 1024;
  if (bytes < kb) return '$bytes B';
  if (bytes < mb) return '${(bytes / kb).toStringAsFixed(1)} KB';
  if (bytes < gb) return '${(bytes / mb).toStringAsFixed(1)} MB';
  return '${(bytes / gb).toStringAsFixed(1)} GB';
}
