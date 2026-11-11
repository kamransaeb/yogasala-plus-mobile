import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/auth/domain/repositories/auth_repository.dart';

/// Injectable bindings for the reset password use case.
/// [ResetPasswordUseCase] is used to reset the password for a user.
@injectable
class ResetPasswordUseCase
    implements BaseUseCase<void, ResetPasswordUseCaseParams> {
  /// Creates a new [ResetPasswordUseCase] instance.
  ResetPasswordUseCase(this._authRepository);

  /// The repository for the authentication service.
  final AuthRepository _authRepository;

  @override
  FutureOr<Either<Failure, void>> call(ResetPasswordUseCaseParams params) {
    return _authRepository.sendPasswordResetEmail(email: params.email);
  }
}

/// Parameters for the reset password use case.
class ResetPasswordUseCaseParams extends Equatable {
  /// Creates a new [ResetPasswordUseCaseParams] instance.
  const ResetPasswordUseCaseParams({required this.email});

  /// The email of the user.
  final String email;

  @override
  List<Object?> get props => [email];
}
