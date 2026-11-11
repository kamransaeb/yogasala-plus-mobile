import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/auth/domain/repositories/auth_repository.dart';

/// The use case for signing up a user.
@injectable
class SignUpUseCase implements BaseUseCase<void, SignUpUseCaseParams> {
  /// Creates a new [SignUpUseCase] instance.
  SignUpUseCase(this._authRepository);

  /// The repository for the authentication service.
  final AuthRepository _authRepository;

  @override
  FutureOr<Either<Failure, void>> call(SignUpUseCaseParams params) {
    return _authRepository.signUpWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
  }
}

/// Parameters for the sign up use case.
class SignUpUseCaseParams extends Equatable {
  /// Creates a new [SignUpUseCaseParams] instance.
  const SignUpUseCaseParams({
    required this.email,
    required this.password,
  });

  /// The email of the user.
  final String email;

  /// The password of the user.
  final String password;

  @override
  List<Object?> get props => [email, password];
}
