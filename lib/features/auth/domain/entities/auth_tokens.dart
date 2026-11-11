/// Immutable token bundle.
class AuthTokens {
  /// Creates a new [AuthTokens] instance.
  const AuthTokens({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresAt,
  });

  /// The access token.
  final String accessToken;

  /// The refresh token.
  final String refreshToken;

  /// The expiration date of the tokens.
  final DateTime expiresAt;

  /// True when the access token is missing or within [skew] of expiry.
  bool isExpired({Duration skew = const Duration(minutes: 2)}) {
    if (accessToken.isEmpty) return true;
    return !expiresAt.isAfter(DateTime.now().add(skew));
  }
}
