import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:yogasala_plus_mobile/features/subscriptions/domain/entities/subscription_package.dart';

/// RevenueCat purchases facade.
abstract class PurchasesRepository {
  /// Configures the SDK (no-op when API keys are missing).
  Future<void> configure();

  /// Identifies the purchaser with the Firebase uid.
  Future<Either<Failure, void>> logIn(String appUserId);

  /// Clears the RevenueCat user on logout.
  Future<Either<Failure, void>> logOut();

  /// Current offering packages mapped to STANDARD / PREMIUM.
  Future<Either<Failure, List<SubscriptionPackage>>> getPackages();

  /// Purchases the package with [packageId].
  Future<Either<Failure, void>> purchase(String packageId);

  /// Restores previous store purchases.
  Future<Either<Failure, void>> restore();
}
