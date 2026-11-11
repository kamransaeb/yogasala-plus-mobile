import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/features/app/presentation/bloc/app_bloc.dart';
import 'package:yogasala_plus_mobile/features/home/domain/entities/category_section.dart';
import 'package:yogasala_plus_mobile/features/home/presentation/bloc/home_bloc.dart';
import 'package:yogasala_plus_mobile/features/home/presentation/widgets/home_serie_list_box.dart';
import 'package:yogasala_plus_mobile/features/teachers/domain/entities/teacher.dart';

/// One vertical-list row: category title + horizontal paginated series row.
class HomeSerieListHorizontalBox extends StatefulWidget {
  /// Creates a [HomeSerieListHorizontalBox].
  const HomeSerieListHorizontalBox({
    required this.categorySection,
    this.teachersById = const {},
    super.key,
  });

  /// Category + series for this row.
  final CategorySection categorySection;

  /// Teachers keyed by id for series subtitle labels.
  final Map<int, Teacher> teachersById;

  @override
  State<HomeSerieListHorizontalBox> createState() =>
      _HomeSerieListHorizontalBoxState();
}

class _HomeSerieListHorizontalBoxState
    extends State<HomeSerieListHorizontalBox> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
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

    final section = widget.categorySection;
    final categoryId = section.category.id;
    if (categoryId == null || section.isLoadingMore || !section.hasMore) {
      return;
    }

    context.read<HomeBloc>().add(
      HomeEvent.categorySeriesNextPageRequested(categoryId: categoryId),
    );
  }

  @override
  Widget build(BuildContext context) {
    final locale = context.watch<AppBloc>().state.locale;
    final section = widget.categorySection;
    final teachersById = widget.teachersById;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: AppDimensions.p24,
          ),
          child: Text(
            section.category.nameForLocale(locale),
            style: Theme.of(context).textTheme.titleLarge,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
          ),
        ),
        SingleChildScrollView(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.fromLTRB(
            AppDimensions.p8,
            AppDimensions.p8,
            AppDimensions.p24,
            AppDimensions.p16,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final series in section.series)
                HomeSerieListBox(
                  serie: series,
                  teacher: teachersById[series.teacherId],
                ),
              if (section.isLoadingMore)
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDimensions.p24,
                    vertical: AppDimensions.p48,
                  ),
                  child: SizedBox(
                    width: AppDimensions.p24,
                    height: AppDimensions.p24,
                    child: AppLoadingIndicator(),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
