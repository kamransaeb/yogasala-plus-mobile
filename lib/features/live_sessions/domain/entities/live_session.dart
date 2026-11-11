import 'package:yogasala_plus_mobile/core/enums/live_provider.dart';

/// Upcoming live session occurrence from `GET /mobile/user/live-sessions`.
class LiveSession {
  /// Creates a [LiveSession].
  const LiveSession({
    required this.slotId,
    required this.title,
    required this.weekday,
    required this.startsAt,
    required this.endsAt,
    required this.startsAtRaw,
    this.nameTr,
    this.nameEn,
    this.descriptionTr,
    this.descriptionEn,
    this.imageUrl,
    this.teacherId,
    this.teacherName,
    this.provider,
  });

  /// Template / slot id used for join.
  final int slotId;

  /// Fallback title.
  final String title;

  /// Display name (TR).
  final String? nameTr;

  /// Display name (EN).
  final String? nameEn;

  /// Description (TR).
  final String? descriptionTr;

  /// Description (EN).
  final String? descriptionEn;

  /// Cover image URL.
  final String? imageUrl;

  /// Teacher id, if any.
  final int? teacherId;

  /// Teacher display name, if any.
  final String? teacherName;

  /// ISO weekday (1=Mon … 7=Sun).
  final int weekday;

  /// Live provider (0 = ZOOM).
  final LiveProvider? provider;

  /// Occurrence start (parsed).
  final DateTime startsAt;

  /// Exact `startsAt` wire value for join `occurrenceStart`.
  final String startsAtRaw;

  /// Occurrence end.
  final DateTime endsAt;

  /// Localized display name for [locale] (`tr` / `en`).
  String nameForLocale(String locale) {
    final tr = nameTr?.trim() ?? '';
    final en = nameEn?.trim() ?? '';
    if (locale == 'tr') {
      if (tr.isNotEmpty) return tr;
      if (en.isNotEmpty) return en;
    } else {
      if (en.isNotEmpty) return en;
      if (tr.isNotEmpty) return tr;
    }
    return title.trim();
  }

  /// Localized description for [locale].
  String descriptionForLocale(String locale) {
    final tr = descriptionTr?.trim() ?? '';
    final en = descriptionEn?.trim() ?? '';
    if (locale == 'tr') {
      return tr.isNotEmpty ? tr : en;
    }
    return en.isNotEmpty ? en : tr;
  }

  /// Join window: 30 min before [startsAt] until 15 min after [endsAt].
  bool get isJoinWindowOpen {
    final now = DateTime.now();
    final openAt = startsAt.subtract(const Duration(minutes: 30));
    final closeAt = endsAt.add(const Duration(minutes: 15));
    return !now.isBefore(openAt) && !now.isAfter(closeAt);
  }

  /// Whether the session has not opened yet.
  bool get isBeforeJoinWindow {
    final openAt = startsAt.subtract(const Duration(minutes: 30));
    return DateTime.now().isBefore(openAt);
  }
}
