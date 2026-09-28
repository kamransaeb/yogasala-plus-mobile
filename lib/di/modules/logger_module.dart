import 'package:enterprise_logger/enterprise_logger.dart';
import 'package:injectable/injectable.dart';

// @module annotation is used to define a module that will be used to inject the
// dependencies. This is useful when you want to inject a dependency that is not
// owned by you.
/// [LoggerModule] is the module for the logger.
@module
abstract class LoggerModule {
  /// Configures the logger for the app.
  @singleton
  LoggerConfig loggerConfig() =>
      const LoggerConfig(flavor: AppFlavor.dev, enableLogging: true);

  /// Creates a logger service.
  @singleton
  LoggerService loggerService(LoggerConfig config) =>
      LoggerServiceImpl(config: config);
}
