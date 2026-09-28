import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/features/app/presentation/bloc/app_bloc.dart';
import 'package:yogasala_plus_mobile/features/home/domain/entities/video_category_section.dart';
import 'package:yogasala_plus_mobile/features/home/presentation/widgets/home_videos_list_box.dart';

/// Horizontal list of videos under a category title.
class HomeVideosListHorizontalBox extends StatelessWidget {
  /// Creates a [HomeVideosListHorizontalBox].
  const HomeVideosListHorizontalBox({
    required this.section,
    super.key,
  });

  /// Category + videos for this row.
  final VideoCategorySection section;

  @override
  Widget build(BuildContext context) {
    final locale = context.watch<AppBloc>().state.locale;
    final width = MediaQuery.sizeOf(context).width;
    const padding = AppDimensions.pagePadding;
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    final rowHeight = (width / 2) +
        (padding / 2) +
        (padding / 2) +
        ((titleStyle?.fontSize ?? 15) * 1.3) +
        (padding / 8);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: padding / 2,
            left: padding / 2,
            right: padding,
          ),
          child: Text(
            section.category.nameForLocale(locale),
            style: titleStyle,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: padding / 4),
          height: rowHeight,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            physics: const ClampingScrollPhysics(),
            itemCount: section.videos.length,
            itemBuilder: (context, index) {
              return HomeVideosListBox(video: section.videos[index]);
            },
          ),
        ),
      ],
    );
  }
}
