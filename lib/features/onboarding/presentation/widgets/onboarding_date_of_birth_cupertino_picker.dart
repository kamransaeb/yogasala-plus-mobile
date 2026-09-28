import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/constants/app_assets_icons.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/widgets/svg_icon.dart';
import 'package:yogasala_plus_mobile/features/onboarding/presentation/bloc/onboarding_date_of_birth/onboarding_date_of_birth_bloc.dart';

/// Cupertino-style birth-date picker shown inside a modal bottom sheet.
class OnboardingDateOfBirthCupertinoPicker extends StatelessWidget {
  /// Creates an [OnboardingDateOfBirthCupertinoPicker].
  const OnboardingDateOfBirthCupertinoPicker({super.key});

  @override
  Widget build(BuildContext context) {
    final dateOfBirth = context.select<OnboardingDateOfBirthBloc, DateTime>(
      (bloc) => bloc.state.dateOfBirth,
    );

    var initial = DateTime(
      dateOfBirth.year,
      dateOfBirth.month,
      dateOfBirth.day,
    );
    final now = DateTime.now();
    final maxDate = DateTime(now.year - 10, now.month, now.day);
    final minDate = DateTime(now.year - 100);
    if (initial.isAfter(maxDate)) initial = maxDate;
    if (initial.isBefore(minDate)) initial = minDate;

    return Column(
      children: [
        FractionallySizedBox(
          widthFactor: 0.3,
          child: Container(
            height: AppDimensions.pagePadding / 5,
            decoration: BoxDecoration(
              color: CupertinoDynamicColor.resolve(
                CupertinoColors.tertiarySystemFill,
                context,
              ),
              borderRadius: BorderRadius.circular(
                AppDimensions.circularBorderRadius,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            tooltip: 'ok'.tr(),
            onPressed: () => Navigator.pop(context),
            icon: const SvgIcon(
              asset: AppAssetsIcons.arrowDone,
              size: AppDimensions.iconSizeLarge,
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: dateOfBirth,
              minimumDate: DateTime(now.year - 100),
              maximumDate: DateTime(now.year - 10),
              onDateTimeChanged: (newDate) {
                context.read<OnboardingDateOfBirthBloc>().add(
                  OnboardingDateOfBirthEvent.dateOfBirthChanged(
                    DateTime(
                      newDate.year,
                      newDate.month,
                      newDate.day,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
