import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:yogasala_plus_mobile/errors/messages/message_utils.dart';

/// Message for device / hardware and permission failures, or null when
/// [failure] is neither.
String? deviceFailureMessage(Failure failure) => switch (failure) {
  final HardwareNotAvailableFailure f => 'hardware_not_available_error'.tr(
    args: [f.deviceFeature ?? 'hardware'],
  ),
  final SensorFailure f => switch (f.code) {
    'SENSOR_NOT_AVAILABLE' => 'sensor_not_available_error'.tr(
      args: [f.deviceFeature ?? 'Sensor'],
    ),
    'SENSOR_PERMISSION_DENIED' => 'sensor_permission_error'.tr(
      args: [f.deviceFeature ?? 'Sensor'],
    ),
    _ => f.message,
  },
  BiometricFailure() => _byCode(failure, _biometricKeys),
  CameraFailure() => _byCode(failure, _cameraKeys),
  MicrophoneFailure() => _byCode(failure, _microphoneKeys),
  LocationFailure() => _byCode(failure, _locationKeys),
  final BluetoothFailure f when f.code == 'BLUETOOTH_CONNECTION_FAILED' =>
    'bluetooth_connection_error'.tr(args: [f.deviceName ?? 'Device']),
  BluetoothFailure() => _byCode(failure, _bluetoothKeys),
  BatteryFailure(:final batteryLevel?) when batteryLevel <= 15 =>
    'critical_battery_error'.tr(args: ['$batteryLevel']),
  BatteryFailure(:final batteryLevel?) when batteryLevel <= 20 =>
    'low_battery_error'.tr(args: ['$batteryLevel']),
  BatteryFailure(:final message) => message,
  StorageDeviceFailure(:final requiredSpace?, :final availableSpace?) =>
    'insufficient_storage_error'.tr(
      args: [formatByteSize(requiredSpace), formatByteSize(availableSpace)],
    ),
  StorageDeviceFailure() => 'storage_error'.tr(),
  DisplayFailure() => 'unsupported_display_error'.tr(),
  PermissionFailure(:final permission, permanentlyDenied: true) =>
    'permission_permanently_denied'.tr(args: [permission]),
  PermissionFailure(:final permission) =>
    'permission_required'.tr(args: [permission]),
  _ => null,
};

/// Localized message for [failure]'s `code`, else its raw message.
String _byCode(Failure failure, Map<String, String> keys) =>
    keys[failure.code]?.tr() ?? failure.message;

const _biometricKeys = {
  'BIOMETRIC_NOT_AVAILABLE': 'biometric_not_available_error',
  'BIOMETRIC_NOT_ENROLLED': 'biometric_not_enrolled_error',
  'BIOMETRIC_LOCKED_OUT': 'biometric_locked_out_error',
  'BIOMETRIC_AUTH_FAILED': 'biometric_auth_failed_error',
};

const _cameraKeys = {
  'CAMERA_NOT_AVAILABLE': 'camera_not_available_error',
  'CAMERA_IN_USE': 'camera_in_use_error',
  'CAMERA_PERMISSION_DENIED': 'camera_permission_error',
};

const _microphoneKeys = {
  'MICROPHONE_NOT_AVAILABLE': 'microphone_not_available_error',
  'MICROPHONE_PERMISSION_DENIED': 'microphone_permission_error',
  'MICROPHONE_RECORDING_FAILED': 'recording_failed_error',
};

const _locationKeys = {
  'LOCATION_SERVICES_DISABLED': 'location_services_disabled_error',
  'LOCATION_PERMISSION_DENIED': 'location_permission_error',
  'LOCATION_PERMISSION_PERMANENTLY_DENIED':
      'location_permission_permanently_denied_error',
  'LOCATION_TIMEOUT': 'location_timeout_error',
  'LOCATION_UNAVAILABLE': 'location_unavailable_error',
};

const _bluetoothKeys = {
  'BLUETOOTH_NOT_AVAILABLE': 'bluetooth_not_available_error',
  'BLUETOOTH_DISABLED': 'bluetooth_disabled_error',
  'BLUETOOTH_PERMISSION_DENIED': 'bluetooth_permission_error',
};
