import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/material.dart';
import 'package:yogasala_plus_mobile/core/constants/app_colors.dart';

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
    var scheme = base.colorScheme.copyWith(
      primary: AppColors.primary,
      onPrimary: AppColors.white,
      secondaryContainer: AppColors.orange4, // light orange wash
      onSecondaryContainer: AppColors.primary, // or darker text
    );
    if (base.brightness == Brightness.dark) {
      scheme = scheme.copyWith(
        surface: AppColors.black, // or Colors.black
        onSurface: AppColors.white,
        surfaceContainerLowest: AppColors.surfaceContainerLowest,
        surfaceContainerLow: AppColors.surfaceContainerLow,
        surfaceContainer: AppColors.surfaceContainer,
        surfaceContainerHigh: AppColors.surfaceContainerHigh,
        surfaceContainerHighest: AppColors.surfaceContainerHighest,
        // optional: kill warm tint
        surfaceTint: Colors.transparent,
      );
    }

    final textTheme = _textTheme.apply(
      bodyColor: scheme.onSurface,
      displayColor: scheme.onSurface,
    );

    return base.copyWith(
      colorScheme: scheme,
      scaffoldBackgroundColor: base.brightness == Brightness.dark
          ? AppColors.black
          : null,
      primaryColor: AppColors.primary,
      textTheme: textTheme,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: scheme.primary,
        selectionColor: scheme.primary.withValues(alpha: 0.3),
        selectionHandleColor: scheme.primary,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: scheme.surface,
        surfaceTintColor: scheme.surfaceTint,
      ),
      appBarTheme: base.appBarTheme.copyWith(
        elevation: 2,
        scrolledUnderElevation: 2,
        centerTitle: true,
        shadowColor: scheme.shadow,
        //surfaceTintColor: Colors.transparent,
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
        iconTheme: IconThemeData(color: scheme.onSurface),
        toolbarTextStyle: textTheme.bodyMedium,
        titleTextStyle: textTheme.titleLarge,
      ),
      dividerTheme: DividerThemeData(color: scheme.outlineVariant),
      tabBarTheme: TabBarThemeData(indicatorColor: scheme.primary),
      chipTheme: ChipThemeData(
        backgroundColor: scheme.surfaceContainerLow,
        selectedColor: scheme.primary,
        checkmarkColor: scheme.onPrimary,
        surfaceTintColor: Colors.transparent,
        labelStyle: TextStyle(color: scheme.onSurface),
        secondaryLabelStyle: TextStyle(color: scheme.onPrimary),
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
  );
}
