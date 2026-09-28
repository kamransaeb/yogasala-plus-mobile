import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/auth/domain/repositories/auth_repository.dart';

/// Injectable bindings for the logout use case.
/// [LogoutUseCase] is used to logout a user from the application.
@injectable
class LogoutUseCase extends BaseUseCase<void, NoParams> {
  /// Creates a new [LogoutUseCase] instance.
  LogoutUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, void>> call(NoParams params) => _repository.logout();
}
