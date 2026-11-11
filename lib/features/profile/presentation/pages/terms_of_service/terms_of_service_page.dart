import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/di/injection.dart';
import 'package:yogasala_plus_mobile/features/profile/presentation/bloc/terms_of_service/terms_of_service_bloc.dart';
import 'package:yogasala_plus_mobile/features/profile/presentation/widgets/legal_document_body.dart';

/// Profile terms / user consent confirmation document viewer.
@RoutePage()
class TermsOfServicePage extends StatelessWidget {
  /// Creates a [TermsOfServicePage].
  const TermsOfServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.locale;

    return BlocProvider(
      create: (_) =>
          getIt<TermsOfServiceBloc>()..add(const TermsOfServiceEvent.fetched()),
      child: Scaffold(
        appBar: AppBar(
          //  title: Text('terms_of_service'.tr()),
        ),
        body: BlocBuilder<TermsOfServiceBloc, TermsOfServiceState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: AppLoadingIndicator());
            }

            final isTr = context.locale.languageCode.toLowerCase().startsWith(
              'tr',
            );

            return LegalDocumentBody(
              sectionTitleKey: 'user_consent_confirmation_form',
              text: state.textForLocale(isTr: isTr),
            );
          },
        ),
      ),
    );
  }
}
