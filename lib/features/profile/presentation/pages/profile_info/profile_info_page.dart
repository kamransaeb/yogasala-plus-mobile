import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/di/injection.dart';
import 'package:yogasala_plus_mobile/features/profile/domain/entities/user_yoga_sala_plus.dart';
import 'package:yogasala_plus_mobile/features/profile/presentation/bloc/profile_info/profile_info_bloc.dart';
import 'package:yogasala_plus_mobile/features/profile/presentation/pages/profile_info/profile_info_form.dart';

/// Edit profile photo, name, surname, date of birth, and gender in one form.
@RoutePage()
class ProfileInfoPage extends StatelessWidget {
  /// Creates a [ProfileInfoPage].
  const ProfileInfoPage({required this.userYogaSalaPlus, super.key});

  /// Current user profile.
  final UserYogaSalaPlus userYogaSalaPlus;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<ProfileInfoBloc>()
            ..add(ProfileInfoEvent.fetched(userYogaSalaPlus)),
      child: Scaffold(
        appBar: AppBar(
          actions: const [],
        ),
        body: const Padding(
          padding: EdgeInsets.fromLTRB(
            AppDimensions.p24,
            0,
            //AppDimensions.p24,
            AppDimensions.p24,
            0,
          ),
          child: ProfileInfoForm(),
        ),
      ),
    );
  }
}
