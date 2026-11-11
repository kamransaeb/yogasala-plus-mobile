import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:enterprise_logger/enterprise_logger.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:yogasala_plus_mobile/core/enums/subscription_plan.dart';
import 'package:yogasala_plus_mobile/errors/purchases_error_codes.dart';
import 'package:yogasala_plus_mobile/features/app/app_config.dart';
import 'package:yogasala_plus_mobile/features/subscriptions/domain/entities/subscription_package.dart';
import 'package:yogasala_plus_mobile/features/subscriptions/domain/repositories/purchases_repository.dart';

/// RevenueCat-backed implementation of [PurchasesRepository].
@LazySingleton(as: PurchasesRepository)
class PurchasesRepositoryImpl implements PurchasesRepository {
  /// Creates a [PurchasesRepositoryImpl].
  PurchasesRepositoryImpl(this._appConfig, this._logger);

  final AppConfig _appConfig;
  final LoggerService _logger;

  bool _configured = false;
  final Map<String, Package> _packagesById = {};

  @override
  Future<void> configure() async {
    if (_configured) return;

    final apiKey = Platform.isIOS
        ? _appConfig.revenueCatApiKeyIos
        : _appConfig.revenueCatApiKeyAndroid;
    if (apiKey.trim().isEmpty) {
      _logger.w('RevenueCat API key missing; purchases disabled');
      return;
    }

    try {
      await Purchases.setLogLevel(
        _appConfig.enableLogging ? LogLevel.debug : LogLevel.info,
      );
      await Purchases.configure(PurchasesConfiguration(apiKey));
      _configured = true;
      _logger.i('RevenueCat configured');
    } on Object catch (e, stackTrace) {
      _logger.e(
        'RevenueCat configure failed',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<Either<Failure, void>> logIn(String appUserId) async {
    await configure();
    if (!_configured) return const Right(null);
    try {
      await Purchases.logIn(appUserId);
      return const Right(null);
    } on Object catch (e, stackTrace) {
      return Left(_mapError(e, stackTrace, 'purchasesLogIn'));
    }
  }

  @override
  Future<Either<Failure, void>> logOut() async {
    if (!_configured) return const Right(null);
    try {
      await Purchases.logOut();
      _packagesById.clear();
      return const Right(null);
    } on Object catch (e, stackTrace) {
      return Left(_mapError(e, stackTrace, 'purchasesLogOut'));
    }
  }

  @override
  Future<Either<Failure, List<SubscriptionPackage>>> getPackages() async {
    await configure();
    if (!_configured) {
      return const Left(_notConfiguredFailure);
    }
    try {
      final offerings = await Purchases.getOfferings();
      final current = offerings.current;
      if (current == null || current.availablePackages.isEmpty) {
        return const Left(
          BusinessFailure(
            message: PurchasesErrorCodes.offeringNotFound,
            code: PurchasesErrorCodes.offeringNotFound,
            ruleName: 'offerings',
          ),
        );
      }

      _packagesById
        ..clear()
        ..addEntries(
          current.availablePackages.map(
            (pkg) => MapEntry(pkg.identifier, pkg),
          ),
        );

      final packages = <SubscriptionPackage>[];
      for (final pkg in current.availablePackages) {
        final plan = SubscriptionPlan.fromProductId(pkg.identifier) ??
            SubscriptionPlan.fromProductId(pkg.storeProduct.identifier);
        if (plan == null) continue;
        packages.add(
          SubscriptionPackage(
            packageId: pkg.identifier,
            plan: plan,
            priceString: pkg.storeProduct.priceString,
            title: pkg.storeProduct.title,
            description: pkg.storeProduct.description,
          ),
        );
      }

      if (packages.isEmpty) {
        return const Left(
          BusinessFailure(
            message: PurchasesErrorCodes.packagesNotFound,
            code: PurchasesErrorCodes.packagesNotFound,
            ruleName: 'packages',
          ),
        );
      }

      packages.sort((a, b) => a.plan.index.compareTo(b.plan.index));
      return Right(packages);
    } on Object catch (e, stackTrace) {
      return Left(_mapError(e, stackTrace, 'getPackages'));
    }
  }

  @override
  Future<Either<Failure, void>> purchase(String packageId) async {
    await configure();
    if (!_configured) {
      return const Left(_notConfiguredFailure);
    }
    try {
      var package = _packagesById[packageId];
      if (package == null) {
        final loaded = await getPackages();
        if (loaded.isLeft()) {
          return loaded.map((_) {});
        }
        package = _packagesById[packageId];
      }
      if (package == null) {
        return Left(
          BusinessFailure(
            message: PurchasesErrorCodes.packageNotFound,
            code: PurchasesErrorCodes.packageNotFound,
            ruleName: 'purchase',
            details: {'packageId': packageId},
          ),
        );
      }

      await Purchases.purchase(PurchaseParams.package(package));
      return const Right(null);
    } on PlatformException catch (e, stackTrace) {
      final code = PurchasesErrorHelper.getErrorCode(e);
      if (code == PurchasesErrorCode.purchaseCancelledError) {
        return const Left(
          BusinessFailure(
            message: PurchasesErrorCodes.purchaseCancelled,
            code: PurchasesErrorCodes.purchaseCancelled,
            ruleName: 'purchase',
          ),
        );
      }
      return Left(_mapError(e, stackTrace, 'purchase'));
    } on Object catch (e, stackTrace) {
      return Left(_mapError(e, stackTrace, 'purchase'));
    }
  }

  @override
  Future<Either<Failure, void>> restore() async {
    await configure();
    if (!_configured) {
      return const Left(_notConfiguredFailure);
    }
    try {
      await Purchases.restorePurchases();
      return const Right(null);
    } on Object catch (e, stackTrace) {
      return Left(_mapError(e, stackTrace, 'restorePurchases'));
    }
  }

  Failure _mapError(Object error, StackTrace stackTrace, String reason) {
    _logger.e(
      'RevenueCat $reason failed',
      error: error,
      stackTrace: stackTrace,
    );
    if (error is PlatformException) {
      return UnknownFailure(
        message: error.message ?? PurchasesErrorCodes.purchaseFailed,
        code: PurchasesErrorCodes.purchaseFailed,
        details: {
          'platformCode': error.code,
          'reason': reason,
        },
      );
    }
    return UnknownFailure(
      message: PurchasesErrorCodes.purchaseFailed,
      code: PurchasesErrorCodes.purchaseFailed,
      details: {
        'error': error.toString(),
        'reason': reason,
      },
    );
  }

  static const BusinessFailure _notConfiguredFailure = BusinessFailure(
    message: PurchasesErrorCodes.purchasesNotConfigured,
    code: PurchasesErrorCodes.purchasesNotConfigured,
    ruleName: 'purchases',
  );
}
