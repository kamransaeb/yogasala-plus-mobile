import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yogasala_plus_mobile/core/constants/app_assets_icons.dart';
import 'package:yogasala_plus_mobile/core/constants/app_colors.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/widgets/svg_icon.dart';

/// App-specific ThemeData on top of shared [AppTheme].
abstract final class BrandTheme {
  /// Light theme.
  static ThemeData get light =>
      _applyBrand(AppTheme.light(seed: AppColors.primary));

  /// Dark theme.
  static ThemeData get dark =>
      _applyBrand(AppTheme.dark(seed: AppColors.primary));

  static ThemeData _applyBrand(ThemeData base) {
    // Keep the fromSeed palette, but force exact brand primary for both
    // light and dark so buttons/links match AppColors.primary.
    final isDark = base.brightness == Brightness.dark;
    // Shared fill for TextFields and disabled FilledButtons.

    var scheme = base.colorScheme.copyWith(
      primary: AppColors.primary,
      onPrimary: AppColors.white,
      secondaryContainer: AppColors.orange4, // light orange wash
      onSecondaryContainer: AppColors.primary, // or darker text
    );
    if (isDark) {
      scheme = scheme.copyWith(
        surface: AppColors.black,
        surfaceBright: AppColors.black4,
        surfaceDim: AppColors.black,
        onSurface: AppColors.white,
        onSurfaceVariant: AppColors.white,
        inverseSurface: AppColors.white,
        onInverseSurface: AppColors.black,
        outline: AppColors.grey1,
        outlineVariant: AppColors.white,
        surfaceContainerLowest: AppColors.black1,
        surfaceContainerLow: AppColors.black2,
        surfaceContainer: AppColors.black3,
        surfaceContainerHigh: AppColors.black4,
        surfaceContainerHighest: AppColors.black5,
      );
    } else {
      scheme = scheme.copyWith(
        surface: AppColors.white,
        surfaceBright: AppColors.white,
        surfaceDim: AppColors.grey6,
        onSurface: AppColors.black, // #212121 — not seed-tinted
        onSurfaceVariant: AppColors.grey1,
        surfaceContainerLowest: AppColors.white,
        surfaceContainerLow: AppColors.grey6, // #fafafa
        surfaceContainer: AppColors.grey5, // #f5f5f5
        surfaceContainerHigh: AppColors.grey4,
        surfaceContainerHighest: AppColors.grey3,
        surfaceTint: Colors.transparent, // kills M3 orange wash on surfaces
        outline: AppColors.grey2,
        outlineVariant: AppColors.black,
        inverseSurface: AppColors.black,
        onInverseSurface: AppColors.white,
      );
    }

    final textTheme = _textTheme.apply(
      bodyColor: scheme.onSurface,
      displayColor: scheme.onSurface,
    );

    return base.copyWith(
      shadowColor: isDark ? AppColors.grey1 : Colors.black,
      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: base.brightness,
        primaryColor: scheme.primary,
        textTheme: CupertinoTextThemeData(
          dateTimePickerTextStyle:
              (textTheme.titleMedium ?? const TextStyle(fontSize: 15)).copyWith(
                color: scheme.onSurface,
              ),
        ),
      ),

      listTileTheme: ListTileThemeData(
        iconColor: isDark ? AppColors.white : AppColors.icon,
        textColor: isDark ? AppColors.white : AppColors.text,
      ),
      colorScheme: scheme,
      scaffoldBackgroundColor: isDark ? AppColors.black : AppColors.white,
      primaryColor: AppColors.primary,
      textTheme: textTheme,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: scheme.primary,
        selectionColor: scheme.primary.withValues(alpha: 0.3),
        selectionHandleColor: scheme.primary,
      ),
      iconTheme: IconThemeData(
        color: isDark ? AppColors.white : AppColors.black,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: scheme.surfaceBright,
        surfaceTintColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppDimensions.circularBorderRadius),
          ),
        ),
      ),
      // Neutral AppBar: container contrast in dark, classic shadow in light.
      // No surfaceTint — seed tint is orange and washes the bar.
      actionIconTheme: ActionIconThemeData(
        backButtonIconBuilder: (context) => const SvgIcon(
          asset: AppAssetsIcons.arrowLeft, // your back asset
        ),
        // or: Icon(Icons.arrow_back_ios_new),
      ),
      appBarTheme: base.appBarTheme.copyWith(
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
        surfaceTintColor: Colors.transparent,

        iconTheme: IconThemeData(
          color: isDark ? AppColors.white : AppColors.black,
        ),
        actionsIconTheme: IconThemeData(
          color: isDark ? AppColors.white : AppColors.black,
        ),
        toolbarTextStyle: textTheme.bodyMedium,
        titleTextStyle: textTheme.titleLarge,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: scheme.surfaceBright,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppDimensions.circularBorderRadius,
          ),
        ),
      ),

      dividerTheme: DividerThemeData(color: scheme.outline),
      tabBarTheme: TabBarThemeData(indicatorColor: scheme.primary),
      chipTheme: ChipThemeData(
        backgroundColor: scheme.surfaceContainerHigh,
        selectedColor: scheme.primary,
        checkmarkColor: scheme.onPrimary,
        surfaceTintColor: Colors.transparent,
        labelStyle: TextStyle(color: scheme.onSurface),
        secondaryLabelStyle: TextStyle(color: scheme.onPrimary),
      ),
      inputDecorationTheme: base.inputDecorationTheme.copyWith(
        filled: true,
        fillColor: scheme.surfaceContainerHigh,
        // Match OutlinedButton side color (colorScheme.outline).
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppDimensions.textFieldBorderRadius,
          ),
          borderSide: BorderSide(
            color: scheme.outline,
            width: AppDimensions.borderLineWidth,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppDimensions.textFieldBorderRadius,
          ),
          borderSide: BorderSide(
            color: scheme.outline,
            width: AppDimensions.borderLineWidth,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppDimensions.textFieldBorderRadius,
          ),
          borderSide: BorderSide(
            color: scheme.primary,
            width: AppDimensions.borderLineWidth * 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppDimensions.textFieldBorderRadius,
          ),
          borderSide: BorderSide(
            color: scheme.error,
            width: AppDimensions.borderLineWidth,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppDimensions.textFieldBorderRadius,
          ),
          borderSide: BorderSide(
            color: scheme.error,
            width: AppDimensions.borderLineWidth * 2,
          ),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: (base.filledButtonTheme.style ?? const ButtonStyle()).merge(
          FilledButton.styleFrom(
            disabledBackgroundColor: scheme.surfaceContainerHigh,
            disabledForegroundColor: scheme.surfaceContainerLowest,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: scheme.primary, // text/icon
          disabledForegroundColor: scheme.surfaceContainerLowest,
          side: BorderSide(color: scheme.outline),
        ),
      ),
    );
  }

  /// Typography only — colors come from [ColorScheme] in [_applyBrand].
  static const TextTheme _textTheme = TextTheme(
    titleSmall: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.bold,
      fontFamily: 'Montserrat-Medium',
    ),
    titleMedium: TextStyle(
      fontSize: 15,
      fontFamily: 'Montserrat-Medium',
      fontWeight: FontWeight.bold,
    ),
    titleLarge: TextStyle(
      fontSize: 17,
      fontFamily: 'Montserrat-Medium',
      fontWeight: FontWeight.bold,
    ),
    bodySmall: TextStyle(
      fontSize: 13,
      fontFamily: 'Montserrat-Regular',
    ),
    bodyMedium: TextStyle(
      fontSize: 15,
      fontFamily: 'Montserrat-Regular',
    ),
    bodyLarge: TextStyle(
      fontSize: 17,
      fontFamily: 'Montserrat-Regular',
    ),
    headlineSmall: TextStyle(
      fontSize: 19,
      fontFamily: 'Montserrat-Medium',
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      fontSize: 21,
      fontFamily: 'Montserrat-Medium',
      fontWeight: FontWeight.bold,
    ),
    headlineLarge: TextStyle(
      fontSize: 23,
      fontFamily: 'Montserrat-Medium',
      fontWeight: FontWeight.bold,
    ),
    labelSmall: TextStyle(
      fontSize: 11,
      fontFamily: 'Montserrat-Regular',
      fontWeight: FontWeight.bold,
    ),
    labelMedium: TextStyle(
      fontSize: 13,
      fontFamily: 'Montserrat-Regular',
      fontWeight: FontWeight.bold,
    ),
    labelLarge: TextStyle(
      fontSize: 15,
      fontFamily: 'Montserrat-Regular',
      fontWeight: FontWeight.bold,
    ),
  );
}
