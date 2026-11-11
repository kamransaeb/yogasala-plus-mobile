import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/profile/domain/entities/user_yoga_sala_plus.dart';
import 'package:yogasala_plus_mobile/features/profile/domain/repositories/user_yoga_sala_plus_repository.dart';

/// Loads the current mobile user profile.
@injectable
class GetUserYogaSalaPlusMobileUserUseCase
    extends BaseUseCase<UserYogaSalaPlus, NoParams> {
  /// Creates a [GetUserYogaSalaPlusMobileUserUseCase].
  GetUserYogaSalaPlusMobileUserUseCase(this._repository);

  final UserYogaSalaPlusRepository _repository;

  @override
  Future<Either<Failure, UserYogaSalaPlus>> call(NoParams params) {
    return _repository.getUserYogaSalaPlusMobileUser();
  }
}
