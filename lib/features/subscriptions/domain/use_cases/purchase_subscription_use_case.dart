import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/subscriptions/domain/repositories/purchases_repository.dart';

/// Purchases a RevenueCat package by id.
@injectable
class PurchaseSubscriptionUseCase
    extends BaseUseCase<void, PurchaseSubscriptionParams> {
  /// Creates a [PurchaseSubscriptionUseCase].
  PurchaseSubscriptionUseCase(this._repository);

  final PurchasesRepository _repository;

  @override
  Future<Either<Failure, void>> call(PurchaseSubscriptionParams params) {
    return _repository.purchase(params.packageId);
  }
}

/// Params for [PurchaseSubscriptionUseCase].
class PurchaseSubscriptionParams extends Equatable {
  /// Creates params.
  const PurchaseSubscriptionParams({required this.packageId});

  /// RevenueCat package identifier.
  final String packageId;

  @override
  List<Object> get props => [packageId];
}
