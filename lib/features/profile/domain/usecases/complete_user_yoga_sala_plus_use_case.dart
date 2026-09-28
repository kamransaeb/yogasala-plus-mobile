import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/profile/domain/entities/user_yoga_sala_plus.dart';
import 'package:yogasala_plus_mobile/features/profile/domain/repositories/user_yoga_sala_plus_repository.dart';

/// Completes the onboarding profile for a Yoga Sala Plus user.
@injectable
class CompleteUserYogaSalaPlusUseCase
    implements BaseUseCase<UserYogaSalaPlus, CompletUserYogaSalaPlusParams> {
  /// Creates a [CompleteUserYogaSalaPlusUseCase].
  const CompleteUserYogaSalaPlusUseCase(this._userYogaSalaPlusRepository);

  final UserYogaSalaPlusRepository _userYogaSalaPlusRepository;

  @override
  FutureOr<Either<Failure, UserYogaSalaPlus>> call(
    CompletUserYogaSalaPlusParams params,
  ) {
    return _userYogaSalaPlusRepository.completeUserYogaSalaPlusMobileUser(
      params.userYogaSalaPlus,
    );
  }
}

/// Parameters for [CompleteUserYogaSalaPlusUseCase].
class CompletUserYogaSalaPlusParams extends Equatable {
  /// Creates [CompletUserYogaSalaPlusParams].
  const CompletUserYogaSalaPlusParams({required this.userYogaSalaPlus});

  /// User payload to submit as completed.
  final UserYogaSalaPlus userYogaSalaPlus;

  @override
  List<Object> get props => [userYogaSalaPlus];
}
