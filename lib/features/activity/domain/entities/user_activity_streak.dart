/// Current practice streak for the authenticated user.
class UserActivityStreak {
  /// Creates a [UserActivityStreak].
  const UserActivityStreak({
    required this.currentStreak,
    this.bestStreak = 0,
    this.lastActivityDate,
  });

  /// Consecutive active days (0 if broken / none).
  final int currentStreak;

  /// Longest streak achieved so far.
  final int bestStreak;

  /// Last day with any activity (`yyyy-MM-dd` from API), if any.
  final DateTime? lastActivityDate;
}
