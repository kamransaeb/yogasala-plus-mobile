import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/theme/theme_bloc.dart';

/// AppBar action that cycles light / dark / system via [ThemeBloc].
class ThemeToggleButton extends StatelessWidget {
  /// Creates a [ThemeToggleButton].
  const ThemeToggleButton({super.key, this.padding, this.size});

  /// Padding for the button.
  final EdgeInsetsGeometry? padding;

  /// Button size. Defaults to [AppButtonSize.medium].
  final AppButtonSize? size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        final status = themeState.currentThemeStatus;
        return AppButton(
          variant: AppButtonVariant.icon,
          size: size ?? AppButtonSize.medium,
          padding: padding,
          icon: status.icon,
          onPressed: () => context.read<ThemeBloc>().add(
            const ThemeEvent.toggleRequested(),
          ),
        );
      },
    );
  }
}
