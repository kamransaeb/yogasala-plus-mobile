import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/subscriptions/domain/entities/subscription_package.dart';
import 'package:yogasala_plus_mobile/features/subscriptions/domain/repositories/purchases_repository.dart';

/// Loads RevenueCat packages for the paywall.
@injectable
class GetSubscriptionPackagesUseCase
    extends BaseUseCase<List<SubscriptionPackage>, NoParams> {
  /// Creates a [GetSubscriptionPackagesUseCase].
  GetSubscriptionPackagesUseCase(this._repository);

  final PurchasesRepository _repository;

  @override
  Future<Either<Failure, List<SubscriptionPackage>>> call(NoParams params) {
    return _repository.getPackages();
  }
}
