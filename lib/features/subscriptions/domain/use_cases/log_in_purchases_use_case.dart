import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/subscriptions/domain/repositories/purchases_repository.dart';

/// Identifies RevenueCat with the Firebase uid after login.
@injectable
class LogInPurchasesUseCase extends BaseUseCase<void, LogInPurchasesParams> {
  /// Creates a [LogInPurchasesUseCase].
  LogInPurchasesUseCase(this._repository);

  final PurchasesRepository _repository;

  @override
  Future<Either<Failure, void>> call(LogInPurchasesParams params) {
    return _repository.logIn(params.appUserId);
  }
}

/// Params for [LogInPurchasesUseCase].
class LogInPurchasesParams extends Equatable {
  /// Creates params.
  const LogInPurchasesParams({required this.appUserId});

  /// Firebase uid.
  final String appUserId;

  @override
  List<Object> get props => [appUserId];
}
