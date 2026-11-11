import 'package:yogasala_plus_mobile/core/enums/activity_type.dart';

/// Activity types recorded for a single calendar day (user TZ).
class UserActivityDay {
  /// Creates a [UserActivityDay].
  const UserActivityDay({
    required this.date,
    required this.types,
  });

  /// Calendar day (date-only; time ignored).
  final DateTime date;

  /// Activity types on this day (VIDEO and/or LIVE).
  final List<ActivityType> types;

  /// Whether this day includes video practice.
  bool get hasVideo => types.contains(ActivityType.video);

  /// Whether this day includes a live session.
  bool get hasLive => types.contains(ActivityType.live);
}
