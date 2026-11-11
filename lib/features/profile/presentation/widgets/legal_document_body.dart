import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/constants/app_spacing.dart';

/// Titled scrollable legal text (no acceptance UI).
class LegalDocumentBody extends StatelessWidget {
  /// Creates a [LegalDocumentBody].
  const LegalDocumentBody({
    required this.sectionTitleKey,
    required this.text,
    super.key,
  });

  /// Localization key for the section heading.
  final String sectionTitleKey;

  /// Document body text.
  final String text;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(
        AppDimensions.p24,
        0,
        AppDimensions.p24,
        AppDimensions.p24,
      ),
      children: [
        Text(
          sectionTitleKey.tr(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        AppSpacing.verticalSpacing8,
        _ScrollableTextBox(text: text),
      ],
    );
  }
}

class _ScrollableTextBox extends StatelessWidget {
  const _ScrollableTextBox({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      padding: const EdgeInsets.all(AppDimensions.p16),
      decoration: BoxDecoration(
        border: Border.all(color: theme.colorScheme.outline),
        borderRadius: BorderRadius.circular(
          AppDimensions.halfBorderRadius,
        ),
      ),
      child: SingleChildScrollView(
        child: Text(text, style: theme.textTheme.bodySmall),
      ),
    );
  }
}
