import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/theme/theme_bloc.dart';

/// AppBar action that cycles light / dark / system via [ThemeBloc].
class ThemeToggleButton extends StatelessWidget {
  /// Creates a [ThemeToggleButton].
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        final status = themeState.currentThemeStatus;
        return IconButton(
          tooltip: status.displayName,
          icon: Icon(status.icon),
          onPressed: () => context.read<ThemeBloc>().add(
            const ThemeEvent.toggleRequested(),
          ),
        );
      },
    );
  }
}
