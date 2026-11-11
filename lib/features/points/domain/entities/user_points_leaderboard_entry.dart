/// One row on the points leaderboard.
class UserPointsLeaderboardEntry {
  /// Creates a [UserPointsLeaderboardEntry].
  const UserPointsLeaderboardEntry({
    required this.id,
    required this.balance,
    this.name,
    this.surname,
    this.profileImageUrl,
  });

  /// User id.
  final int id;

  /// First name.
  final String? name;

  /// Last name.
  final String? surname;

  /// Profile image URL.
  final String? profileImageUrl;

  /// Points balance.
  final int balance;

  /// Display name (`name surname`), trimmed.
  String get fullName {
    final parts = [
      name?.trim(),
      surname?.trim(),
    ].whereType<String>().where((p) => p.isNotEmpty);
    return parts.join(' ');
  }
}
