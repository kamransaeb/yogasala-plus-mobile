import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/features/auth/presentation/bloc/auth_bloc.dart';

/// Page to display the profile of the user
@RoutePage()
class ProfilePage extends StatelessWidget {
  /// Constructor
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            tooltip: 'logout'.tr(),
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<AuthBloc>().add(
                const AuthEvent.logoutRequested(),
              );
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Profile'),
      ),
    );
  }
}
