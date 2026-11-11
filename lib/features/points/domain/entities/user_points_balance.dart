/// Current user's points balance.
class UserPointsBalance {
  /// Creates a [UserPointsBalance].
  const UserPointsBalance({
    required this.userId,
    required this.balance,
  });

  /// User id.
  final int userId;

  /// Current points balance.
  final int balance;
}
