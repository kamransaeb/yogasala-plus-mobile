import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/profile/domain/entities/user_yoga_sala_plus.dart';
import 'package:yogasala_plus_mobile/features/profile/domain/repositories/user_yoga_sala_plus_repository.dart';

/// Use case to get or create a user yoga sala plus open mobile.
@injectable
class GetOrCreateUserYogaSalaPlusOpenMobileUseCase
    implements BaseUseCase<UserYogaSalaPlus, NoParams> {
  /// Constructor
  const GetOrCreateUserYogaSalaPlusOpenMobileUseCase(
    this._userYogaSalaPlusRepository,
  );

  final UserYogaSalaPlusRepository _userYogaSalaPlusRepository;

  @override
  Future<Either<Failure, UserYogaSalaPlus>> call(NoParams params) async {
    return _userYogaSalaPlusRepository.getOrCreateUserYogaSalaPlusOpenMobile();
  }
}
