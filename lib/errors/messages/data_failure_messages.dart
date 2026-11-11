import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:yogasala_plus_mobile/errors/messages/message_utils.dart';

/// Message for serialization and file failures, or null when [failure] is
/// neither.
String? dataFailureMessage(Failure failure) => switch (failure) {
  JsonSerializationFailure(:final jsonPath?) =>
    'invalid_data_at_path_error'.tr(args: [jsonPath]),
  JsonSerializationFailure() => 'invalid_data_error'.tr(),
  ModelConversionFailure() => 'data_conversion_error'.tr(),
  HiveSerializationFailure() => 'storage_read_error'.tr(),
  EncodingFailure() => 'encoding_error'.tr(),
  DateSerializationFailure() => 'date_format_error'.tr(),
  EnumSerializationFailure() => 'invalid_value_error'.tr(),
  FileNotFoundFailure() => 'file_not_found_error'.tr(),
  final FileTooLargeFailure f => 'file_too_large_error'.tr(
    namedArgs: {
      'file_size': formatByteSize(f.fileSize),
      'max_size': formatByteSize(f.maxSize),
    },
  ),
  _ => null,
};
