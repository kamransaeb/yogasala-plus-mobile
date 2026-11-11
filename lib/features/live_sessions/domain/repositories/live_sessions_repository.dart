import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:yogasala_plus_mobile/features/live_sessions/domain/entities/live_join.dart';
import 'package:yogasala_plus_mobile/features/live_sessions/domain/entities/live_session.dart';

/// Live sessions repository.
abstract class LiveSessionsRepository {
  /// Upcoming sessions (default 7 days, max 28).
  Future<Either<Failure, List<LiveSession>>> getLiveSessions({int days = 7});

  /// Join an occurrence; returns external [LiveJoin.joinUrl].
  ///
  /// [occurrenceStart] must be the exact `startsAt` string from the list item.
  Future<Either<Failure, LiveJoin>> joinLiveSession({
    required int slotId,
    required String occurrenceStart,
  });
}
