import 'package:yogasala_plus_mobile/features/live_sessions/data/models/live_join_model.dart';
import 'package:yogasala_plus_mobile/features/live_sessions/data/models/live_session_model.dart';

/// Remote data source for live sessions.
abstract class LiveSessionsRemoteDataSource {
  /// Upcoming sessions for the next [days] days.
  Future<List<LiveSessionModel>> getLiveSessions({int days = 7});

  /// Join with exact [occurrenceStart] ISO from the list item.
  Future<LiveJoinModel> joinLiveSession({
    required int slotId,
    required String occurrenceStart,
  });
}
