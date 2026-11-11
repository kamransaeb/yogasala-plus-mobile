import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/core/enums/activity_type.dart';
import 'package:yogasala_plus_mobile/features/activity/domain/repositories/activity_repository.dart';

/// Marks today in the user's TZ for the given activity type (idempotent).
@injectable
class MarkUserActivityUseCase
    extends BaseUseCase<void, MarkUserActivityParams> {
  /// Creates a [MarkUserActivityUseCase].
  MarkUserActivityUseCase(this._repository);

  final ActivityRepository _repository;

  @override
  Future<Either<Failure, void>> call(MarkUserActivityParams params) {
    return _repository.markActivity(params.type);
  }
}

/// Params for [MarkUserActivityUseCase].
class MarkUserActivityParams extends Equatable {
  /// Creates params.
  const MarkUserActivityParams({required this.type});

  /// Activity type to mark for today.
  final ActivityType type;

  @override
  List<Object> get props => [type];
}
