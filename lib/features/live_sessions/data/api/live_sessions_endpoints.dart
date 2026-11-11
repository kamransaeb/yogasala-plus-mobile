/// Live sessions endpoints (upcoming occurrences + join).
abstract final class LiveSessionsEndpoints {
  /// List upcoming live sessions.
  static const String liveSessions = '/mobile/user/live-sessions';

  /// Join a live session occurrence.
  static const String join = '/mobile/user/live-sessions/{slotId}/join';
}
