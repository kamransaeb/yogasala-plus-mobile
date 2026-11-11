import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/subscriptions/domain/entities/user_entitlements.dart';
import 'package:yogasala_plus_mobile/features/subscriptions/domain/repositories/entitlements_repository.dart';

/// Loads entitlements from the backend.
@injectable
class GetUserEntitlementsUseCase
    extends BaseUseCase<UserEntitlements, NoParams> {
  /// Creates a [GetUserEntitlementsUseCase].
  GetUserEntitlementsUseCase(this._repository);

  final EntitlementsRepository _repository;

  @override
  Future<Either<Failure, UserEntitlements>> call(NoParams params) {
    return _repository.getEntitlements();
  }
}
