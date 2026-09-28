import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:yogasala_plus_mobile/core/constants/app_assets_icons.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';

/// Shows a non-dismissible force-update dialog using store URLs from AppBloc.
///
/// Store badge / URL are chosen from locale + platform (iOS App Store /
/// Android Play). No-ops if [context] is unmounted or both URLs are empty.
Future<void> showUpdateAppDialog(
  BuildContext context, {
  required String storeUrlEn,
  required String storeUrlTr,
  String messageKey = 'please_update_app',
}) async {
  if (!context.mounted) return;
  if (storeUrlEn.isEmpty && storeUrlTr.isEmpty) return;

  final isTr = context.locale.languageCode == 'tr';
  final updateAppUrl = isTr ? storeUrlTr : storeUrlEn;
  final updateAppAsset = _storeBadgeAsset(isTr: isTr);

  await showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (dialogContext) => UpdateAppDialog(
      messageKey: messageKey,
      updateAppAsset: updateAppAsset,
      updateAppUrl: updateAppUrl,
    ),
  );
}

String _storeBadgeAsset({required bool isTr}) {
  if (Platform.isIOS) {
    return isTr ? AppAssetsIcons.appStoreTr : AppAssetsIcons.appStoreEn;
  }
  return isTr ? AppAssetsIcons.googlePlayTr : AppAssetsIcons.googlePlayEn;
}

/// Stateless force-update dialog (title, store badge, message).
class UpdateAppDialog extends StatelessWidget {
  /// Creates an [UpdateAppDialog].
  const UpdateAppDialog({
    required this.messageKey,
    required this.updateAppAsset,
    required this.updateAppUrl,
    super.key,
  });

  /// Localization key for the body message.
  final String messageKey;

  /// SVG asset path for App Store / Play badge.
  final String updateAppAsset;

  /// Store listing URL opened when the badge is tapped.
  final String updateAppUrl;

  Future<void> _openStore() async {
    if (updateAppUrl.isEmpty) return;
    if (await canLaunchUrlString(updateAppUrl)) {
      await launchUrlString(
        updateAppUrl,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.sizeOf(context).width;
    const padding = AppDimensions.pagePadding;

    // Full-width card; colors/shape from [BrandTheme.dialogTheme].
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      constraints: BoxConstraints(minWidth: width, maxWidth: width),
      title: Text(
        'app_update'.tr(),
        textAlign: TextAlign.center,
        style: theme.textTheme.titleLarge,
      ),
      content: SizedBox(
        width: width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: _openStore,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: padding),
                child: SvgPicture.asset(
                  updateAppAsset,
                  height: AppDimensions.iconSizeExtraLarge,
                ),
              ),
            ),
            const SizedBox(height: padding),
            Text(
              messageKey.tr(),
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
