import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/subscriptions/data/datasources/entitlements_remote_data_source.dart';
import 'package:yogasala_plus_mobile/features/subscriptions/domain/entities/user_entitlements.dart';
import 'package:yogasala_plus_mobile/features/subscriptions/domain/repositories/entitlements_repository.dart';

/// Implementation of [EntitlementsRepository].
@LazySingleton(as: EntitlementsRepository)
class EntitlementsRepositoryImpl implements EntitlementsRepository {
  /// Creates an [EntitlementsRepositoryImpl].
  EntitlementsRepositoryImpl(this._remote, this._errorHandler);

  final EntitlementsRemoteDataSource _remote;
  final ErrorHandler _errorHandler;

  @override
  Future<Either<Failure, UserEntitlements>> getEntitlements() async {
    try {
      final model = await _remote.getEntitlements();
      return Right(model.toEntity());
    } on Object catch (e, stackTrace) {
      return Left(
        _errorHandler.handleError(
          e,
          stackTrace: stackTrace,
          reason: 'getEntitlements',
        ),
      );
    }
  }
}
