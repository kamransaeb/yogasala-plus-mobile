import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/profile/domain/entities/user_yoga_sala_plus.dart';
import 'package:yogasala_plus_mobile/features/profile/domain/repositories/user_yoga_sala_plus_repository.dart';

/// Updates the current mobile user profile.
@injectable
class UpdateUserYogaSalaPlusMobileUserUseCase
    extends BaseUseCase<UserYogaSalaPlus, UpdateUserYogaSalaPlusMobileUserParams> {
  /// Creates an [UpdateUserYogaSalaPlusMobileUserUseCase].
  UpdateUserYogaSalaPlusMobileUserUseCase(this._repository);

  final UserYogaSalaPlusRepository _repository;

  @override
  Future<Either<Failure, UserYogaSalaPlus>> call(
    UpdateUserYogaSalaPlusMobileUserParams params,
  ) {
    return _repository.updateUserYogaSalaPlusMobileUser(
      params.userYogaSalaPlus,
    );
  }
}

/// Params for [UpdateUserYogaSalaPlusMobileUserUseCase].
class UpdateUserYogaSalaPlusMobileUserParams extends Equatable {
  /// Creates params.
  const UpdateUserYogaSalaPlusMobileUserParams({
    required this.userYogaSalaPlus,
  });

  /// User payload to update.
  final UserYogaSalaPlus userYogaSalaPlus;

  @override
  List<Object> get props => [userYogaSalaPlus];
}
