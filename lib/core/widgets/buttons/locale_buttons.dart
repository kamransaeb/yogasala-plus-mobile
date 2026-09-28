import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/constants/app_spacing.dart';
import 'package:yogasala_plus_mobile/features/app/presentation/bloc/app_bloc.dart';

/// Compact TR / EN locale chips for the login [AppBar].
///
/// Dispatches [AppEvent.localeChanged]; [AppBloc] persists and owns locale.
class LocaleButtons extends StatelessWidget {
  /// Creates [LocaleButtons].
  const LocaleButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final languageCode = context.select<AppBloc, String>(
      (bloc) => bloc.state.locale,
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _LocaleChip(
          code: 'tr',
          selected: languageCode == 'tr',
        ),
        AppSpacing.horizontalSpacing4,
        _LocaleChip(
          code: 'en',
          selected: languageCode == 'en',
        ),
      ],
    );
  }
}

class _LocaleChip extends StatelessWidget {
  const _LocaleChip({
    required this.code,
    required this.selected,
  });

  final String code;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final borderColor = selected
        ? scheme.inverseSurface
        : scheme.outlineVariant;
    final background = selected ? scheme.inverseSurface : Colors.transparent;
    final foreground = selected ? scheme.onInverseSurface : scheme.onSurface;

    return Material(
      color: background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
        side: BorderSide(
          color: borderColor,
          width: AppDimensions.borderLineWidth,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
        onTap: () => context.read<AppBloc>().add(
          AppEvent.localeChanged(locale: code),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.p8,
            vertical: AppDimensions.p8,
          ),
          child: Text(
            code.toUpperCase(),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: foreground,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
