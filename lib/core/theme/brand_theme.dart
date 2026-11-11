import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yogasala_plus_mobile/core/constants/app_colors.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/constants/app_icons.dart';
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
      error: AppColors.red,
      onError: AppColors.white,
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
      canvasColor: scheme.surface, // kill orange menu panel
      focusColor: scheme.surfaceContainerHigh,
      splashColor: scheme.surfaceContainerHigh,
      hoverColor: scheme.surfaceContainerHigh,
      shadowColor: isDark ? AppColors.grey1 : Colors.black,
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: isDark ? AppColors.black : AppColors.white,
        selectedIconTheme: const IconThemeData(color: AppColors.primary),
        selectedLabelTextStyle: const TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.w600,
        ),
        indicatorColor: AppColors.primary.withValues(alpha: 0.12),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: scheme.surfaceBright,
      ),
      dataTableTheme: DataTableThemeData(
        headingRowColor: WidgetStatePropertyAll(
          scheme.surfaceContainerHigh,
        ),
        headingTextStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: scheme.onSurface,
        ),
      ),

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
      dropdownMenuTheme: DropdownMenuThemeData(
        inputDecorationTheme: InputDecorationThemeData(
          filled: true,
          fillColor: scheme.surfaceContainerHigh,
          // Match OutlinedButton side color (colorScheme.outline).
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              AppDimensions.fullBorderRadius,
            ),
            borderSide: BorderSide(
              color: scheme.outline,
              width: AppDimensions.borderLineWidth,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              AppDimensions.fullBorderRadius,
            ),
            borderSide: BorderSide(
              color: scheme.outline,
              width: AppDimensions.borderLineWidth,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              AppDimensions.fullBorderRadius,
            ),
            borderSide: BorderSide(
              color: scheme.primary,
              width: AppDimensions.borderLineWidth * 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              AppDimensions.fullBorderRadius,
            ),
            borderSide: BorderSide(
              color: scheme.error,
              width: AppDimensions.borderLineWidth,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              AppDimensions.fullBorderRadius,
            ),
            borderSide: BorderSide(
              color: scheme.error,
              width: AppDimensions.borderLineWidth * 2,
            ),
          ),
        ),
      ),
      listTileTheme: ListTileThemeData(
        iconColor: isDark ? AppColors.white : AppColors.icon,
        textColor: isDark ? AppColors.white : AppColors.text,
        selectedTileColor: scheme.surfaceContainerHigh,
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
          asset: AppIcons.arrowLeft, // your back asset
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
            AppDimensions.dialogBorderRadius,
          ),
        ),
      ),

      dividerTheme: DividerThemeData(color: scheme.outline),
      tabBarTheme: TabBarThemeData(indicatorColor: scheme.primary),
      chipTheme: ChipThemeData(
        backgroundColor: scheme.surfaceContainerHigh,
        selectedColor: scheme.primary,
        showCheckmark: false,
        surfaceTintColor: Colors.transparent,
        labelStyle: TextStyle(
          color: WidgetStateColor.resolveWith((states) {
            if (states.contains(WidgetState.hovered)) {
              return scheme.primary;
            }
            if (states.contains(WidgetState.selected)) {
              return scheme.onPrimary;
            }

            return scheme.onSurface;
          }),
        ),
        secondaryLabelStyle: TextStyle(
          color: WidgetStateColor.resolveWith((states) {
            if (states.contains(WidgetState.hovered)) {
              return scheme.primary;
            }
            if (states.contains(WidgetState.selected)) {
              return scheme.onPrimary;
            }
            return scheme.onSurface;
          }),
        ),

        side: WidgetStateBorderSide.resolveWith((states) {
          final highlighted =
              states.contains(WidgetState.selected) ||
              states.contains(WidgetState.hovered);
          return BorderSide(
            color: highlighted ? scheme.primary : scheme.outline,
            width: AppDimensions.borderLineWidth,
          );
        }),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppDimensions.fullBorderRadius,
          ),
        ),
      ),
      inputDecorationTheme: base.inputDecorationTheme.copyWith(
        filled: true,
        fillColor: scheme.surfaceContainerHigh,
        // Match OutlinedButton side color (colorScheme.outline).
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppDimensions.fullBorderRadius,
          ),
          borderSide: BorderSide(
            color: scheme.outline,
            width: AppDimensions.borderLineWidth,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppDimensions.fullBorderRadius,
          ),
          borderSide: BorderSide(
            color: scheme.outline,
            width: AppDimensions.borderLineWidth,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppDimensions.fullBorderRadius,
          ),
          borderSide: BorderSide(
            color: scheme.primary,
            width: AppDimensions.borderLineWidth * 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppDimensions.fullBorderRadius,
          ),
          borderSide: BorderSide(
            color: scheme.error,
            width: AppDimensions.borderLineWidth,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppDimensions.fullBorderRadius,
          ),
          borderSide: BorderSide(
            color: scheme.error,
            width: AppDimensions.borderLineWidth * 2,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: _textTheme.titleMedium,
          foregroundColor: scheme.primary,
          disabledForegroundColor: scheme.onSurfaceVariant,
          overlayColor: scheme.onSurface,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          textStyle: _textTheme.titleMedium,
          foregroundColor: scheme.onPrimary,
          disabledBackgroundColor: scheme.surfaceContainerHigh,
          disabledForegroundColor: scheme.surfaceContainerLowest,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          textStyle: _textTheme.titleMedium,
          foregroundColor: scheme.primary, // text/icon
          disabledForegroundColor: scheme.surfaceContainerLowest,
          side: BorderSide(
            color: scheme.outline,
            width: AppDimensions.borderLineWidth,
          ),
        ),
      ),
    );
  }

  /// Typography only — colors come from [ColorScheme] in [_applyBrand].
  static const TextTheme _textTheme = TextTheme(
    titleSmall: TextStyle(
      fontSize: 11,
      //  fontWeight: FontWeight.bold,
      fontFamily: 'Roboto-700',
    ),
    titleMedium: TextStyle(
      fontSize: 13,
      fontFamily: 'Roboto-700',
      // fontWeight: FontWeight.bold,
    ),
    titleLarge: TextStyle(
      fontSize: 15,
      fontFamily: 'Roboto-700',
      //  fontWeight: FontWeight.bold,
    ),
    bodySmall: TextStyle(
      fontSize: 11,
      fontFamily: 'Roboto-400',
    ),
    bodyMedium: TextStyle(
      fontSize: 13,
      fontFamily: 'Roboto-400',
    ),
    bodyLarge: TextStyle(
      fontSize: 15,
      fontFamily: 'Roboto-400',
    ),
    headlineSmall: TextStyle(
      fontSize: 17,
      fontFamily: 'Roboto-700',
      // fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      fontSize: 19,
      fontFamily: 'Roboto-700',
      // fontWeight: FontWeight.bold,
    ),
    headlineLarge: TextStyle(
      fontSize: 21,
      fontFamily: 'Roboto-700',
      // fontWeight: FontWeight.bold,
    ),
    labelSmall: TextStyle(
      fontSize: 9,
      fontFamily: 'Roboto-700',
      // fontWeight: FontWeight.bold,
    ),
    labelMedium: TextStyle(
      fontSize: 11,
      fontFamily: 'Roboto-700',
      //fontWeight: FontWeight.bold,
    ),
    labelLarge: TextStyle(
      fontSize: 13,
      fontFamily: 'Roboto-700',
      // fontWeight: FontWeight.bold,
    ),
  );
}
