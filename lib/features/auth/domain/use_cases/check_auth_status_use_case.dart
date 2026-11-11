import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/auth/domain/entities/auth_user.dart';
import 'package:yogasala_plus_mobile/features/auth/domain/repositories/auth_repository.dart';

/// Checks whether a valid session exists and loads the current user when it
/// does.
///
/// Returns:
/// - `Right(null)` — not authenticated
/// - `Right(user)` — authenticated
/// - `Left(failure)` — error while loading the user / refreshing tokens
@injectable
class CheckAuthStatusUseCase extends BaseUseCase<AuthUser?, NoParams> {
  /// Creates a new [CheckAuthStatusUseCase] instance.
  CheckAuthStatusUseCase(this._repository);

  final AuthRepository _repository;

  @override
  FutureOr<Either<Failure, AuthUser?>> call(NoParams params) async {
    final isAuthenticated = await _repository.isAuthenticated();
    if (!isAuthenticated) {
      return const Right(null);
    }

    // Ensure Firebase ID token is in secure storage for AuthInterceptor.
    final refreshResult = await _repository.refreshAuthTokens();
    return refreshResult.fold(
      Left.new,
      (_) => _repository.getCurrentAuthUser(),
    );
  }
}
