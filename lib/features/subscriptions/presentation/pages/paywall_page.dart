import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/enums/subscription_plan.dart';
import 'package:yogasala_plus_mobile/di/injection.dart';
import 'package:yogasala_plus_mobile/features/subscriptions/presentation/bloc/paywall_bloc.dart';
import 'package:yogasala_plus_mobile/features/subscriptions/presentation/pages/paywall_form.dart';

/// Subscription / paywall screen (RevenueCat packages).
@RoutePage()
class PaywallPage extends StatelessWidget {
  /// Creates a [PaywallPage].
  const PaywallPage({
    super.key,
    @QueryParam('highlightPlan') this.highlightPlan,
  });

  /// Optional plan wire value to emphasize (`0` / `1`, or `STANDARD` / `PREMIUM`).
  final String? highlightPlan;

  @override
  Widget build(BuildContext context) {
    context.locale;
    final plan = SubscriptionPlan.parse(highlightPlan);

    return BlocProvider(
      create: (_) => getIt<PaywallBloc>()
        ..add(PaywallEvent.fetched(highlightPlan: plan)),
      child: Scaffold(
        appBar: AppBar(
          title: Text('subscription'.tr()),
        ),
        body: const PaywallForm(),
      ),
    );
  }
}
