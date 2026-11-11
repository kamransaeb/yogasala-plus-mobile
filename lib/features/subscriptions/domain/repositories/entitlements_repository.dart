import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:yogasala_plus_mobile/features/subscriptions/domain/entities/user_entitlements.dart';

/// Backend entitlements repository.
abstract class EntitlementsRepository {
  /// Loads current user entitlements from the API.
  Future<Either<Failure, UserEntitlements>> getEntitlements();
}
