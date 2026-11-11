import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/di/injection.dart';
import 'package:yogasala_plus_mobile/features/profile/presentation/bloc/privacy_policy/privacy_policy_bloc.dart';
import 'package:yogasala_plus_mobile/features/profile/presentation/widgets/legal_document_body.dart';

/// Profile privacy policy (KVKK) document viewer.
@RoutePage()
class PrivacyPolicyPage extends StatelessWidget {
  /// Creates a [PrivacyPolicyPage].
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.locale;

    return BlocProvider(
      create: (_) =>
          getIt<PrivacyPolicyBloc>()..add(const PrivacyPolicyEvent.fetched()),
      child: Scaffold(
        appBar: AppBar(
          // title: Text('privacy_policy'.tr()),
        ),
        body: BlocBuilder<PrivacyPolicyBloc, PrivacyPolicyState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: AppLoadingIndicator());
            }

            final isTr = context.locale.languageCode.toLowerCase().startsWith(
              'tr',
            );

            return LegalDocumentBody(
              sectionTitleKey: 'kvkk_privacy_policy',
              text: state.textForLocale(isTr: isTr),
            );
          },
        ),
      ),
    );
  }
}
