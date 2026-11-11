import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/live_sessions/domain/entities/live_session.dart';
import 'package:yogasala_plus_mobile/features/live_sessions/domain/repositories/live_sessions_repository.dart';

/// Loads upcoming live session occurrences.
@injectable
class GetLiveSessionsUseCase
    extends BaseUseCase<List<LiveSession>, GetLiveSessionsParams> {
  /// Creates a [GetLiveSessionsUseCase].
  GetLiveSessionsUseCase(this._repository);

  final LiveSessionsRepository _repository;

  @override
  Future<Either<Failure, List<LiveSession>>> call(
    GetLiveSessionsParams params,
  ) {
    return _repository.getLiveSessions(days: params.days);
  }
}

/// Params for [GetLiveSessionsUseCase].
class GetLiveSessionsParams extends Equatable {
  /// Creates params.
  const GetLiveSessionsParams({this.days = 7});

  /// Lookahead window (1–28; backend default 7).
  final int days;

  @override
  List<Object> get props => [days];
}
