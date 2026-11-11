import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/subscriptions/domain/repositories/purchases_repository.dart';

/// Clears the RevenueCat user on logout.
@injectable
class LogOutPurchasesUseCase extends BaseUseCase<void, NoParams> {
  /// Creates a [LogOutPurchasesUseCase].
  LogOutPurchasesUseCase(this._repository);

  final PurchasesRepository _repository;

  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return _repository.logOut();
  }
}
