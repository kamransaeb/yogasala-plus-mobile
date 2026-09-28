import 'dart:async';
import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:yogasala_plus_mobile/core/constants/app_assets_icons.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/constants/app_spacing.dart';
import 'package:yogasala_plus_mobile/core/navigation/app_router.dart';
import 'package:yogasala_plus_mobile/core/widgets/svg_icon.dart';
import 'package:yogasala_plus_mobile/features/onboarding/presentation/bloc/onboarding_profile_photo/onboarding_profile_photo_bloc.dart';
import 'package:yogasala_plus_mobile/features/onboarding/presentation/widgets/onboarding_header.dart';

/// Profile-photo form for onboarding step 4 (progress 4/5).
class OnboardingProfilePhotoForm extends StatelessWidget {
  /// Creates a [OnboardingProfilePhotoForm].
  const OnboardingProfilePhotoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<
      OnboardingProfilePhotoBloc,
      OnboardingProfilePhotoState
    >(
      listenWhen: (previous, current) =>
          previous.status != current.status &&
          current.status == FormzSubmissionStatus.success,
      listener: (context, state) {
        final user = state.user;
        if (user == null) return;
        unawaited(
          context.router.push(
            OnboardingAgreementsRoute(userYogaSalaPlus: user),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          OnboardingHeader(
            percent: 4 / 5,
            title: 'profile_photo'.tr(),
          ),
          AppSpacing.verticalSpacing24,

          const Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _AvatarPreview(),
                  _EditImageButton(),
                ],
              ),
            ),
          ),

          const _NextButton(),
        ],
      ),
    );
  }
}

class _AvatarPreview extends StatelessWidget {
  const _AvatarPreview();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bytes = context.select<OnboardingProfilePhotoBloc, Uint8List?>(
      (bloc) => bloc.state.imageBytes,
    );

    return InkWell(
      onTap: () => _showImageSheet(context),
      borderRadius: BorderRadius.circular(
        AppDimensions.fullCircularBorderRadius,
      ),
      child: SizedBox(
        width: AppDimensions.largeAvatarSize,
        height: AppDimensions.largeAvatarSize,
        child: bytes != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(
                  AppDimensions.fullCircularBorderRadius,
                ),
                child: Image(image: MemoryImage(bytes), fit: BoxFit.cover),
              )
            : Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    AppDimensions.fullCircularBorderRadius,
                  ),
                  border: Border.all(
                    color: theme.colorScheme.outline,
                    width: AppDimensions.borderLineWidth,
                  ),
                ),
                child: Center(
                  child: SvgIcon(
                    asset: AppAssetsIcons.emptyAvatar,
                    color: theme.colorScheme.outline,
                    size: AppDimensions.iconSizeExtraLarge,
                  ),
                ),
              ),
      ),
    );
  }
}

class _EditImageButton extends StatelessWidget {
  const _EditImageButton();

  @override
  Widget build(BuildContext context) {
    context.locale;
    final hasImage = context.select<OnboardingProfilePhotoBloc, bool>(
      (bloc) => bloc.state.imageBytes != null,
    );

    return TextButton(
      onPressed: () => _showImageSheet(context),
      child: Text(hasImage ? 'edit_image'.tr() : 'add_image'.tr()),
    );
  }
}

Future<void> _showImageSheet(BuildContext context) async {
  final bloc = context.read<OnboardingProfilePhotoBloc>();
  await showModalBottomSheet<void>(
    context: context,
    builder: (sheetContext) {
      return Padding(
        padding: const EdgeInsets.all(
          AppDimensions.pagePadding,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
            AppSpacing.verticalSpacing8,
            ListTile(
              leading: const SvgIcon(
                asset: AppAssetsIcons.camera,
                size: AppDimensions.iconSizeLarge,
              ),
              title: Text('camera'.tr()),
              onTap: () {
                Navigator.pop(sheetContext);
                bloc.add(const OnboardingProfilePhotoEvent.cameraSelected());
              },
            ),

            ListTile(
              leading: const SvgIcon(
                asset: AppAssetsIcons.gallery,
                size: AppDimensions.iconSizeLarge,
              ),
              title: Text('gallery'.tr()),
              onTap: () {
                Navigator.pop(sheetContext);
                bloc.add(const OnboardingProfilePhotoEvent.gallerySelected());
              },
            ),
            ListTile(
              leading: const SvgIcon(
                asset: AppAssetsIcons.delete,
                size: AppDimensions.iconSizeLarge,
              ),

              title: Text('delete'.tr()),
              onTap: () {
                Navigator.pop(sheetContext);
                bloc.add(const OnboardingProfilePhotoEvent.deleted());
              },
            ),
          ],
        ),
      );
    },
  );
}

class _NextButton extends StatelessWidget {
  const _NextButton();

  @override
  Widget build(BuildContext context) {
    context.locale;
    final status = context
        .select<OnboardingProfilePhotoBloc, FormzSubmissionStatus>(
          (bloc) => bloc.state.status,
        );

    if (status == FormzSubmissionStatus.inProgress) {
      return const SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.only(bottom: AppDimensions.pagePadding),
          child: AppLoadingIndicator(),
        ),
      );
    }

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.only(bottom: AppDimensions.pagePadding),
        child: AppButton(
          size: AppButtonSize.large,
          label: 'next'.tr(),
          expanded: true,
          onPressed: () => context.read<OnboardingProfilePhotoBloc>().add(
            const OnboardingProfilePhotoEvent.saved(),
          ),
        ),
      ),
    );
  }
}
