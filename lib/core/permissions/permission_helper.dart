import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart' as ph;

enum AppPermission {
  camera,
  photos,
  location,
  microphone,
  contacts,
  calendar,
  reminders,
  notifications,
  storage,
}

/// App-level permission checks, requests, and simple dialogs.
class PermissionHelper {
  PermissionHelper._();

  static const Map<AppPermission, ph.Permission> _map = {
    AppPermission.camera: ph.Permission.camera,
    AppPermission.photos: ph.Permission.photos,
    AppPermission.location: ph.Permission.locationWhenInUse,
    AppPermission.microphone: ph.Permission.microphone,
    AppPermission.contacts: ph.Permission.contacts,
    AppPermission.calendar: ph.Permission.calendarFullAccess,
    AppPermission.reminders: ph.Permission.reminders,
    AppPermission.notifications: ph.Permission.notification,
    AppPermission.storage: ph.Permission.storage,
  };

  static Future<ph.PermissionStatus> check(AppPermission type) async {
    try {
      return await _map[type]!.status;
    } on PlatformException {
      return ph.PermissionStatus.denied;
    }
  }

  static Future<ph.PermissionStatus> request(AppPermission type) async {
    try {
      return await _map[type]!.request();
    } on PlatformException {
      return ph.PermissionStatus.denied;
    }
  }

  static Future<bool> isGranted(AppPermission type) async =>
      (await check(type)).isGranted;

  static Future<bool> isPermanentlyDenied(AppPermission type) async =>
      (await check(type)).isPermanentlyDenied;

  /// Opens the OS app settings screen.
  static Future<bool> openSettings() => ph.openAppSettings();

  static Future<Map<AppPermission, ph.PermissionStatus>> requestMany(
    List<AppPermission> types,
  ) async {
    final permissions = types.map((t) => _map[t]!).toList();
    final results = await permissions.request();
    return {
      for (final type in types) type: results[_map[type]!]!,
    };
  }

  static String rationaleMessage(AppPermission type) {
    return switch (type) {
      AppPermission.camera => 'permission_rationale_camera'.tr(),
      AppPermission.photos => 'permission_rationale_photos'.tr(),
      AppPermission.location => 'permission_rationale_location'.tr(),
      AppPermission.microphone => 'permission_rationale_microphone'.tr(),
      AppPermission.contacts => 'permission_rationale_contacts'.tr(),
      AppPermission.calendar => 'permission_rationale_calendar'.tr(),
      AppPermission.reminders => 'permission_rationale_reminders'.tr(),
      AppPermission.notifications => 'permission_rationale_notifications'.tr(),
      AppPermission.storage => 'permission_rationale_storage'.tr(),
    };
  }

  static String deniedMessage(AppPermission type) {
    return switch (type) {
      AppPermission.camera => 'permission_denied_camera'.tr(),
      AppPermission.photos => 'permission_denied_photos'.tr(),
      AppPermission.location => 'permission_denied_location'.tr(),
      AppPermission.microphone => 'permission_denied_microphone'.tr(),
      AppPermission.contacts => 'permission_denied_contacts'.tr(),
      AppPermission.calendar => 'permission_denied_calendar'.tr(),
      AppPermission.reminders => 'permission_denied_reminders'.tr(),
      AppPermission.notifications => 'permission_denied_notifications'.tr(),
      AppPermission.storage => 'permission_denied_storage'.tr(),
    };
  }

  /// Requests [type], showing a short rationale / settings dialog when needed.
  static Future<void> ensure(
    BuildContext context,
    AppPermission type, {
    required VoidCallback onGranted,
    VoidCallback? onDenied,
  }) async {
    if (await isGranted(type)) {
      onGranted();
      return;
    }

    final status = await check(type);
    if (!context.mounted) return;

    if (status.isDenied || status.isLimited) {
      final allowed = await _showRationaleDialog(context, type);
      if (!context.mounted) return;
      if (!allowed) {
        onDenied?.call();
        return;
      }
    }

    final result = await request(type);
    if (!context.mounted) return;

    if (result.isGranted) {
      onGranted();
      return;
    }

    onDenied?.call();
    await _showSettingsDialog(context, type);
  }

  static Future<bool> _showRationaleDialog(
    BuildContext context,
    AppPermission type,
  ) async {
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text('permission_required_title'.tr()),
        content: Text(rationaleMessage(type)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text('not_now'.tr()),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text('continue'.tr()),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  static Future<void> _showSettingsDialog(
    BuildContext context,
    AppPermission type,
  ) async {
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text('permission_denied_title'.tr()),
        content: Text(deniedMessage(type)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('cancel'.tr()),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(context);
              await openSettings();
            },
            child: Text('open_settings'.tr()),
          ),
        ],
      ),
    );
  }
}
