import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/constants/app_icons.dart';
import 'package:yogasala_plus_mobile/core/widgets/svg_icon.dart';
import 'package:yogasala_plus_mobile/features/home/presentation/bloc/home_series_bloc.dart';

/// Series tab search field — query lives in [HomeSeriesBloc].
class HomeSeriesSearchField extends StatefulWidget {
  /// Creates a [HomeSeriesSearchField].
  const HomeSeriesSearchField({super.key});

  @override
  State<HomeSeriesSearchField> createState() => _HomeSeriesSearchFieldState();
}

class _HomeSeriesSearchFieldState extends State<HomeSeriesSearchField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: context.read<HomeSeriesBloc>().state.queryOrEmpty,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextField(
      controller: _controller,

      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: 'search_series'.tr(),

        filled: false,
        fillColor: theme.colorScheme.surfaceContainerHigh,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.fullBorderRadius),
          borderSide: BorderSide(
            width: AppDimensions.borderLineWidth,
            color: theme.colorScheme.onSurface,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.fullBorderRadius),
          borderSide: BorderSide(
            width: AppDimensions.borderLineWidth * 2,
            color: theme.colorScheme.outline,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.fullBorderRadius),
          borderSide: BorderSide(
            width: AppDimensions.borderLineWidth,
            color: theme.colorScheme.onSurface,
          ),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(AppDimensions.p12),
          child: SvgIcon(
            asset: AppIcons.search,
            size: AppDimensions.iconSizeSmall,
            color: theme.colorScheme.onSurface,
          ),
        ),

        suffixIcon: _controller.text.isNotEmpty
            ? AppButton(
                variant: AppButtonVariant.icon,
                iconWidget: SvgIcon(
                  asset: AppIcons.arrowClose,
                  color: theme.colorScheme.onSurface,
                ),

                onPressed: () {
                  _controller.clear();
                  setState(() {});
                  context.read<HomeSeriesBloc>().add(
                    const HomeSeriesEvent.queryChanged(query: ''),
                  );
                },
              )
            : null,
      ),
      onChanged: (value) {
        setState(() {});
        context.read<HomeSeriesBloc>().add(
          HomeSeriesEvent.queryChanged(query: value),
        );
      },
    );
  }
}
