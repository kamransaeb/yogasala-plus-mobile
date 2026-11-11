import 'dart:async';
import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/constants/app_icons.dart';
import 'package:yogasala_plus_mobile/core/constants/app_spacing.dart';
import 'package:yogasala_plus_mobile/core/widgets/feedback/app_flushbar.dart';
import 'package:yogasala_plus_mobile/core/widgets/svg_icon.dart';
import 'package:yogasala_plus_mobile/features/profile/presentation/bloc/profile_info/profile_info_bloc.dart';
import 'package:yogasala_plus_mobile/features/profile/presentation/pages/profile_info/profile_info_date_of_birth_cupertino_picker.dart';

/// Combined edit form for photo, name, surname, date of birth, and gender.
class ProfileInfoForm extends StatelessWidget {
  /// Creates a [ProfileInfoForm].
  const ProfileInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    // Wait until [ProfileInfoEvent.fetched] seeds state so TextFormField
    // initialValue is set on first mount (it is not updated later).
    final ready = context.select<ProfileInfoBloc, bool>(
      (bloc) => bloc.state.user != null,
    );
    if (!ready) {
      return const Center(child: AppLoadingIndicator());
    }

    return MultiBlocListener(
      listeners: [
        BlocListener<ProfileInfoBloc, ProfileInfoState>(
          listenWhen: (previous, current) =>
              previous.status != current.status &&
              current.status == FormzSubmissionStatus.success,
          listener: (context, state) {
            unawaited(context.router.maybePop(true));
          },
        ),
        BlocListener<ProfileInfoBloc, ProfileInfoState>(
          listenWhen: (previous, current) =>
              previous.status != current.status &&
              current.status == FormzSubmissionStatus.failure,
          listener: (context, state) {
            final failure = state.failure;
            if (failure == null) return;
            AppFlushbar.showFailure(context, failure);
          },
        ),
      ],
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: _ScrollableFields()),
          _SaveButton(),
        ],
      ),
    );
  }
}

class _ScrollableFields extends StatelessWidget {
  const _ScrollableFields();

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _PhotoSection(),
          //AppSpacing.verticalSpacing8,
          _NameInput(),
          AppSpacing.verticalSpacing16,
          _SurnameInput(),
          AppSpacing.verticalSpacing24,
          _DateOfBirthField(),
          AppSpacing.verticalSpacing24,
          _GenderOptions(),
        ],
      ),
    );
  }
}

class _PhotoSection extends StatelessWidget {
  const _PhotoSection();

  @override
  Widget build(BuildContext context) {
    context.locale;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'profile_photo'.tr(),
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.left,
        ),
        AppSpacing.verticalSpacing16,
        const Center(child: _AvatarPreview()),
        AppSpacing.verticalSpacing16,

        const Center(child: _EditImageButton()),
        AppSpacing.verticalSpacing16,
      ],
    );
  }
}

class _AvatarPreview extends StatelessWidget {
  const _AvatarPreview();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bytes = context.select<ProfileInfoBloc, Uint8List?>(
      (bloc) => bloc.state.imageBytes,
    );
    final removed = context.select<ProfileInfoBloc, bool>(
      (bloc) => bloc.state.removedExisting,
    );
    final networkUrl = context.select<ProfileInfoBloc, String>(
      (bloc) => bloc.state.user?.profileImageUrl?.trim() ?? '',
    );

    final ImageProvider? backgroundImage;
    if (bytes != null) {
      backgroundImage = MemoryImage(bytes);
    } else if (!removed && networkUrl.isNotEmpty) {
      backgroundImage = NetworkImage(networkUrl);
    } else {
      backgroundImage = null;
    }

    return InkWell(
      onTap: () => unawaited(_showImageSheet(context)),
      borderRadius: BorderRadius.circular(
        AppDimensions.fullCircularBorderRadius,
      ),
      child: CircleAvatar(
        radius: AppDimensions.profileAvatarSizeLarge,
        backgroundColor: theme.colorScheme.surfaceContainerHighest,
        backgroundImage: backgroundImage,
        child: backgroundImage == null
            ? SvgIcon(
                asset: AppIcons.emptyAvatar,
                color: theme.colorScheme.outline,
                size: AppDimensions.iconSizeExtraLarge,
              )
            : null,
      ),
    );
  }
}

class _EditImageButton extends StatelessWidget {
  const _EditImageButton();

  @override
  Widget build(BuildContext context) {
    context.locale;
    final hasImage = context.select<ProfileInfoBloc, bool>((bloc) {
      final state = bloc.state;
      if (state.imageBytes != null) return true;
      if (state.removedExisting) return false;
      return (state.user?.profileImageUrl?.trim() ?? '').isNotEmpty;
    });

    return AppButton(
      variant: AppButtonVariant.text,
      padding: EdgeInsets.zero, // required for shrinkWrap

      size: AppButtonSize.small,
      label: hasImage ? 'edit_image'.tr() : 'add_image'.tr(),
      onPressed: () => unawaited(_showImageSheet(context)),
    );
  }
}

Future<void> _showImageSheet(BuildContext context) async {
  final bloc = context.read<ProfileInfoBloc>();
  await showModalBottomSheet<void>(
    context: context,
    builder: (sheetContext) {
      return Padding(
        padding: const EdgeInsets.all(AppDimensions.p24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
            AppSpacing.verticalSpacing8,
            ListTile(
              leading: const SvgIcon(
                asset: AppIcons.camera,
                size: AppDimensions.iconSizeLarge,
              ),
              title: Text('camera'.tr()),
              onTap: () {
                Navigator.pop(sheetContext);
                bloc.add(const ProfileInfoEvent.cameraSelected());
              },
            ),
            ListTile(
              leading: const SvgIcon(
                asset: AppIcons.gallery,
                size: AppDimensions.iconSizeLarge,
              ),
              title: Text('gallery'.tr()),
              onTap: () {
                Navigator.pop(sheetContext);
                bloc.add(const ProfileInfoEvent.gallerySelected());
              },
            ),
            ListTile(
              leading: const SvgIcon(
                asset: AppIcons.delete,
                size: AppDimensions.iconSizeLarge,
              ),
              title: Text('delete'.tr()),
              onTap: () {
                Navigator.pop(sheetContext);
                bloc.add(const ProfileInfoEvent.photoDeleted());
              },
            ),
          ],
        ),
      );
    },
  );
}

class _NameInput extends StatelessWidget {
  const _NameInput();

  @override
  Widget build(BuildContext context) {
    context.locale;
    final displayError = context.select<ProfileInfoBloc, NameValidationError?>(
      (bloc) => bloc.state.nameInput.displayError,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'name_and_surname'.tr(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        AppSpacing.verticalSpacing16,
        TextFormField(
          initialValue: context.read<ProfileInfoBloc>().state.nameInput.value,
          textInputAction: TextInputAction.next,
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(
            labelText: 'name'.tr(),
            errorText: displayError != null ? 'wrong_name'.tr() : null,
          ),
          onChanged: (value) => context.read<ProfileInfoBloc>().add(
            ProfileInfoEvent.nameChanged(value),
          ),
        ),
      ],
    );
  }
}

class _SurnameInput extends StatelessWidget {
  const _SurnameInput();

  @override
  Widget build(BuildContext context) {
    context.locale;
    final displayError = context.select<ProfileInfoBloc, NameValidationError?>(
      (bloc) => bloc.state.surnameInput.displayError,
    );

    return TextFormField(
      initialValue: context.read<ProfileInfoBloc>().state.surnameInput.value,
      textInputAction: TextInputAction.done,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        labelText: 'surname'.tr(),
        errorText: displayError != null ? 'wrong_surname'.tr() : null,
      ),
      onChanged: (value) => context.read<ProfileInfoBloc>().add(
        ProfileInfoEvent.surnameChanged(value),
      ),
    );
  }
}

class _DateOfBirthField extends StatelessWidget {
  const _DateOfBirthField();

  Future<void> _openPicker(BuildContext context) async {
    final bloc = context.read<ProfileInfoBloc>();
    final height = MediaQuery.sizeOf(context).height / 3;

    await showModalBottomSheet<void>(
      context: context,
      enableDrag: false,
      isScrollControlled: true,
      builder: (sheetContext) {
        return SafeArea(
          child: AnimatedContainer(
            duration: const Duration(
              milliseconds: AppDimensions.bottomSheetTransitionDuration,
            ),
            height: height,
            margin: EdgeInsets.only(
              bottom: MediaQuery.viewInsetsOf(sheetContext).bottom,
            ),
            padding: const EdgeInsets.all(AppDimensions.p24),
            child: BlocProvider.value(
              value: bloc,
              child: const ProfileInfoDateOfBirthCupertinoPicker(),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    context.locale;
    final theme = Theme.of(context);
    final dateOfBirth = context.select<ProfileInfoBloc, DateTime>(
      (bloc) => bloc.state.dateOfBirth,
    );
    final formatted = DateFormat.yMMMMd(context.locale.toString()).format(
      dateOfBirth,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'date_of_birth'.tr(),
          style: theme.textTheme.titleLarge,
        ),
        AppSpacing.verticalSpacing8,
        Material(
          color: theme.colorScheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppDimensions.fullBorderRadius,
            ),
            side: BorderSide(
              color: theme.colorScheme.outline,
              width: AppDimensions.borderLineWidth,
            ),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(
              AppDimensions.fullBorderRadius,
            ),
            onTap: () => unawaited(_openPicker(context)),
            child: SizedBox(
              height: AppDimensions.buttonHeight,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      formatted,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleSmall,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: AppDimensions.p16,
                    ),
                    child: SvgIcon(
                      asset: AppIcons.arrowDown,
                      size: AppDimensions.iconSizeSmall,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _GenderOptions extends StatelessWidget {
  const _GenderOptions();

  @override
  Widget build(BuildContext context) {
    context.locale;
    final gender = context.select<ProfileInfoBloc, int>(
      (bloc) => bloc.state.gender,
    );
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'gender'.tr(),
          style: theme.textTheme.titleLarge,
        ),
        AppSpacing.verticalSpacing8,
        Row(
          children: [
            Expanded(
              child: _GenderIconTile(
                label: 'female'.tr(),
                asset: AppIcons.genderFemale,
                selected: gender == 1,
                onTap: () => context.read<ProfileInfoBloc>().add(
                  const ProfileInfoEvent.genderChanged(1),
                ),
              ),
            ),
            AppSpacing.horizontalSpacing16,
            Expanded(
              child: _GenderIconTile(
                label: 'male'.tr(),
                asset: AppIcons.genderMale,
                selected: gender == 0,
                onTap: () => context.read<ProfileInfoBloc>().add(
                  const ProfileInfoEvent.genderChanged(0),
                ),
              ),
            ),
          ],
        ),
        //AppSpacing.verticalSpacing16,
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(
            gender == 2 ? Icons.radio_button_checked : Icons.radio_button_off,
            color: gender == 2
                ? theme.colorScheme.primary
                : theme.colorScheme.outline,
          ),
          title: Text('gender_not_shared'.tr()),
          onTap: () => context.read<ProfileInfoBloc>().add(
            const ProfileInfoEvent.genderChanged(2),
          ),
        ),
      ],
    );
  }
}

class _GenderIconTile extends StatelessWidget {
  const _GenderIconTile({
    required this.label,
    required this.asset,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final String asset;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderColor = selected
        ? theme.colorScheme.primary
        : theme.colorScheme.outline;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppDimensions.halfBorderRadius),
      child: Container(
        padding: const EdgeInsets.all(AppDimensions.p16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            AppDimensions.halfBorderRadius,
          ),
          border: Border.all(
            color: borderColor,
            width: AppDimensions.borderLineWidth,
          ),
        ),
        child: Column(
          children: [
            SvgIcon(
              asset: asset,
              size: AppDimensions.iconSizeExtraExtraLarge,
              color: selected
                  ? theme.colorScheme.primary
                  : theme.colorScheme.outline,
            ),
            AppSpacing.verticalSpacing8,
            Text(
              label,
              style: theme.textTheme.titleMedium!.copyWith(
                color: selected
                    ? theme.colorScheme.primary
                    : theme.colorScheme.outline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton();

  @override
  Widget build(BuildContext context) {
    context.locale;
    final status = context.select<ProfileInfoBloc, FormzSubmissionStatus>(
      (bloc) => bloc.state.status,
    );
    final isValid = context.select<ProfileInfoBloc, bool>(
      (bloc) => bloc.state.isValid,
    );

    if (status == FormzSubmissionStatus.inProgress) {
      return const SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.only(
            top: AppDimensions.p16,
            bottom: AppDimensions.p24,
          ),
          // Center loosens max-width from CrossAxisAlignment.stretch.
          child: Center(child: AppLoadingIndicator()),
        ),
      );
    }

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.only(
          top: AppDimensions.p16,
          bottom: AppDimensions.p24,
        ),
        child: AppButton(
          size: AppButtonSize.large,
          label: 'save'.tr(),
          expanded: true,
          onPressed: isValid
              ? () => context.read<ProfileInfoBloc>().add(
                  const ProfileInfoEvent.saved(),
                )
              : null,
        ),
      ),
    );
  }
}
