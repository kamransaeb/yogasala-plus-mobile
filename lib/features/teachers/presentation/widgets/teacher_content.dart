import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/constants/app_icons.dart';
import 'package:yogasala_plus_mobile/core/widgets/svg_icon.dart';
import 'package:yogasala_plus_mobile/features/home/presentation/widgets/home_serie_list_tile.dart';
import 'package:yogasala_plus_mobile/features/teachers/domain/entities/teacher.dart';
import 'package:yogasala_plus_mobile/features/teachers/presentation/bloc/teacher_bloc.dart';

/// Teacher detail body: centered photo/name and series list.
class TeacherContent extends StatefulWidget {
  /// Creates a [TeacherContent].
  const TeacherContent({required this.teacher, super.key});

  /// Teacher to display.
  final Teacher teacher;

  @override
  State<TeacherContent> createState() => _TeacherContentState();
}

class _TeacherContentState extends State<TeacherContent> {
  late final ScrollController _scrollController;
  late TeacherBloc _bloc;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = context.read<TeacherBloc>();
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final position = _scrollController.position;
    if (position.pixels < position.maxScrollExtent - 200) return;

    final state = _bloc.state;
    if (!state.isSuccess || state.isLoadingMore || !state.hasMore) return;

    _bloc.add(const TeacherEvent.nextPageRequested());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final teacher = widget.teacher;
    final name = teacher.fullName.trim();
    final bio = teacher.bioForLocale(context.locale.languageCode);
    final imageUrl = teacher.imageUrl?.trim() ?? '';
    final width = MediaQuery.sizeOf(context).width;
    final avatarSize = width * 0.45;
    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return BlocBuilder<TeacherBloc, TeacherState>(
      buildWhen: (previous, current) =>
          previous.seriesOrEmpty != current.seriesOrEmpty ||
          previous.isLoadingMore != current.isLoadingMore,
      builder: (context, state) {
        final series = state.seriesOrEmpty;
        final loadingMore = state.isLoadingMore;
        // Header + series (+ optional load-more indicator).
        final itemCount = 1 + series.length + (loadingMore ? 1 : 0);

        return ListView.builder(
          controller: _scrollController,
          padding: EdgeInsets.only(
            bottom: bottomInset > 0 ? bottomInset : AppDimensions.p16,
          ),
          itemCount: itemCount,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Column(
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: avatarSize / 2,
                      backgroundColor:
                          theme.colorScheme.surfaceContainerHighest,
                      backgroundImage: imageUrl.isNotEmpty
                          ? NetworkImage(imageUrl)
                          : null,
                      child: imageUrl.isEmpty
                          ? Icon(
                              Icons.person,
                              size: avatarSize / 2,
                              color: theme.colorScheme.onSurfaceVariant,
                            )
                          : null,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      AppDimensions.p16,
                      AppDimensions.p16,
                      AppDimensions.p16,
                      AppDimensions.p8,
                    ),
                    child: Text(
                      name.isEmpty ? '—' : name,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineSmall,
                    ),
                  ),

                  AppButton(
                    boxColor: theme.colorScheme.onSurface,
                    size: AppButtonSize.small,
                    iconWidget: SvgIcon(
                      asset: AppIcons.sendSocial,
                      color: theme.colorScheme.surface,
                    ),
                    label: 'share'.tr(),
                    labelStyle: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.surface,
                    ),
                    onPressed: () => print('share'.tr()),
                  ),

                  const SizedBox(height: AppDimensions.p8),
                  if (bio.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        AppDimensions.p16,
                        0,
                        AppDimensions.p8,
                        AppDimensions.p8,
                      ),
                      child: _ExpandableBio(
                        bio: bio,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                ],
              );
            }

            final seriesIndex = index - 1;
            if (seriesIndex >= series.length) {
              return const Padding(
                padding: EdgeInsets.all(AppDimensions.p16),
                child: Center(child: AppLoadingIndicator()),
              );
            }

            return HomeSerieListTile(series: series[seriesIndex]);
          },
        );
      },
    );
  }
}

/// Bio text truncated to 2 lines with a show more / show less control.
class _ExpandableBio extends StatefulWidget {
  const _ExpandableBio({
    required this.bio,
    this.style,
  });

  final String bio;
  final TextStyle? style;

  @override
  State<_ExpandableBio> createState() => _ExpandableBioState();
}

class _ExpandableBioState extends State<_ExpandableBio> {
  static const _maxCollapsedLines = 2;

  bool _expanded = false;
  bool _overflows = false;

  @override
  void didUpdateWidget(covariant _ExpandableBio oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.bio != widget.bio) {
      _expanded = false;
      _overflows = false;
    }
  }

  void _checkOverflow(double maxWidth) {
    final painter = TextPainter(
      text: TextSpan(text: widget.bio, style: widget.style),
      textAlign: TextAlign.justify,
      textDirection: Directionality.of(context),
      maxLines: _maxCollapsedLines,
    )..layout(maxWidth: maxWidth);

    final overflows = painter.didExceedMaxLines;
    if (overflows != _overflows) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        setState(() => _overflows = overflows);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        _checkOverflow(constraints.maxWidth);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.bio,
              textAlign: TextAlign.justify,
              style: widget.style,
              maxLines: _expanded ? null : _maxCollapsedLines,
              overflow: _expanded
                  ? TextOverflow.visible
                  : TextOverflow.ellipsis,
            ),
            if (_overflows) const SizedBox(height: AppDimensions.p8),
            if (_overflows)
              Align(
                alignment: Alignment.centerLeft,
                child: AppButton(
                  padding: EdgeInsets.zero,
                  variant: AppButtonVariant.text,
                  size: AppButtonSize.small,
                  labelStyle: theme.textTheme.titleLarge,
                  label: (_expanded ? 'show_less' : 'show_more').tr(),
                  onPressed: () => setState(() => _expanded = !_expanded),
                ),
              ),
          ],
        );
      },
    );
  }
}
