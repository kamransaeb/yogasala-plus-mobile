import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/live_sessions/domain/entities/live_join.dart';
import 'package:yogasala_plus_mobile/features/live_sessions/domain/repositories/live_sessions_repository.dart';

/// Joins a live occurrence and returns the external join URL.
@injectable
class JoinLiveSessionUseCase
    extends BaseUseCase<LiveJoin, JoinLiveSessionParams> {
  /// Creates a [JoinLiveSessionUseCase].
  JoinLiveSessionUseCase(this._repository);

  final LiveSessionsRepository _repository;

  @override
  Future<Either<Failure, LiveJoin>> call(JoinLiveSessionParams params) {
    return _repository.joinLiveSession(
      slotId: params.slotId,
      occurrenceStart: params.occurrenceStart,
    );
  }
}

/// Params for [JoinLiveSessionUseCase].
class JoinLiveSessionParams extends Equatable {
  /// Creates params.
  const JoinLiveSessionParams({
    required this.slotId,
    required this.occurrenceStart,
  });

  /// Slot id.
  final int slotId;

  /// Exact `startsAt` from the list item.
  final String occurrenceStart;

  @override
  List<Object> get props => [slotId, occurrenceStart];
}
