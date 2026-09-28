import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/app/data/datasources/app_data_remote_data_source.dart';
import 'package:yogasala_plus_mobile/features/app/domain/entities/app_data.dart';
import 'package:yogasala_plus_mobile/features/app/domain/repositories/app_data_repository.dart';

/// Implementation of [AppDataRepository].
@Injectable(as: AppDataRepository)
class AppDataRepositoryImpl implements AppDataRepository {
  /// Creates an [AppDataRepositoryImpl].
  AppDataRepositoryImpl(this._remoteDataSource, this._errorHandler);

  final AppDataRemoteDataSource _remoteDataSource;
  final ErrorHandler _errorHandler;

  @override
  Future<Either<Failure, AppData>> getAppData({
    required int appDataId,
  }) async {
    try {
      final response = await _remoteDataSource.getAppDataOpenMobile(
        appDataId: appDataId,
      );
      return Right(response.toEntity());
    } on Object catch (e, stackTrace) {
      return Left(
        _errorHandler.handleError(
          e,
          stackTrace: stackTrace,
          reason: 'getAppData',
        ),
      );
    }
  }
}
