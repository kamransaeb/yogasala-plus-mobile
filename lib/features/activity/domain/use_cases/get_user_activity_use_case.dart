import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/activity/domain/entities/user_activity_day.dart';
import 'package:yogasala_plus_mobile/features/activity/domain/repositories/activity_repository.dart';

/// Loads activity days for a date range (`yyyy-MM-dd`).
@injectable
class GetUserActivityUseCase
    extends BaseUseCase<List<UserActivityDay>, GetUserActivityParams> {
  /// Creates a [GetUserActivityUseCase].
  GetUserActivityUseCase(this._repository);

  final ActivityRepository _repository;

  @override
  Future<Either<Failure, List<UserActivityDay>>> call(
    GetUserActivityParams params,
  ) {
    return _repository.getActivity(from: params.from, to: params.to);
  }
}

/// Params for [GetUserActivityUseCase].
class GetUserActivityParams extends Equatable {
  /// Creates params.
  const GetUserActivityParams({
    required this.from,
    required this.to,
  });

  /// Inclusive range start (`yyyy-MM-dd`).
  final String from;

  /// Inclusive range end (`yyyy-MM-dd`).
  final String to;

  @override
  List<Object> get props => [from, to];
}
