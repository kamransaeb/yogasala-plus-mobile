/// Signed Mux playback payload for the player.
class Playback {
  /// Creates a [Playback].
  const Playback({
    required this.videoId,
    required this.videoTitle,
    required this.playbackId,
    required this.playbackToken,
    required this.streamUrl,
    required this.envKey,
    required this.viewerUserId,
    this.thumbnailToken,
  });

  /// Video id.
  final int videoId;

  /// Video title.
  final String videoTitle;

  /// Mux playback id.
  final String playbackId;

  /// Signed playback JWT.
  final String playbackToken;

  /// Signed thumbnail JWT, if any.
  final String? thumbnailToken;

  /// HLS stream URL (includes token).
  final String streamUrl;

  /// Mux Data environment key.
  final String envKey;

  /// Viewer user id for Mux Data.
  final String viewerUserId;
}
