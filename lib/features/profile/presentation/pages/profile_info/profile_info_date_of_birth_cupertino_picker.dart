import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/constants/app_icons.dart';
import 'package:yogasala_plus_mobile/core/widgets/svg_icon.dart';
import 'package:yogasala_plus_mobile/features/profile/presentation/bloc/profile_info/profile_info_bloc.dart';

/// Cupertino-style birth-date picker for the profile info form.
class ProfileInfoDateOfBirthCupertinoPicker extends StatelessWidget {
  /// Creates a [ProfileInfoDateOfBirthCupertinoPicker].
  const ProfileInfoDateOfBirthCupertinoPicker({super.key});

  @override
  Widget build(BuildContext context) {
    final dateOfBirth = context.select<ProfileInfoBloc, DateTime>(
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
            height: AppDimensions.p24 / 5,
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
          child: Tooltip(
            message: 'ok'.tr(),
            child: AppButton(
              variant: AppButtonVariant.icon,
              iconWidget: const SvgIcon(
                asset: AppIcons.arrowDone,
                size: AppDimensions.iconSizeLarge,
              ),
              padding: const EdgeInsets.all(AppDimensions.p8),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: initial,
              minimumDate: DateTime(now.year - 100),
              maximumDate: DateTime(now.year - 10),
              onDateTimeChanged: (newDate) {
                context.read<ProfileInfoBloc>().add(
                  ProfileInfoEvent.dateOfBirthChanged(
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
