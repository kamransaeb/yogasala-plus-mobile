import 'package:yogasala_plus_mobile/core/enums/live_provider.dart';

/// Join response from `POST …/live-sessions/{slotId}/join`.
class LiveJoin {
  /// Creates a [LiveJoin].
  const LiveJoin({
    required this.slotId,
    required this.provider,
    required this.joinUrl,
    required this.occurrenceStart,
  });

  /// Slot id.
  final int slotId;

  /// Live provider (e.g. Zoom).
  final LiveProvider provider;

  /// External Zoom / browser join URL.
  final String joinUrl;

  /// Occurrence start echoed by the server.
  final DateTime occurrenceStart;
}
