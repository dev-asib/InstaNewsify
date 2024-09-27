import 'package:flutter/material.dart';
import 'package:insta_newsify/core/constants/ColorPalette/light_shades/light_shades_app_colors.dart';

class NewsCardFooter extends StatelessWidget {
  const NewsCardFooter({
    super.key,
    required this.authorName,
    required this.newsDescription,
    required this.newsDate,
  });

  final String authorName;
  final String newsDescription;
  final String newsDate;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            newsDescription,
            maxLines: 3,
            textAlign: TextAlign.justify,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodyLarge?.copyWith(
              color: LightShadesAppColors.newsSubTitleTextColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            authorName,
            overflow: TextOverflow.ellipsis,
            style: textTheme.titleLarge?.copyWith(
              color: LightShadesAppColors.newsTitleTextColor,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            newsDate,
            style: textTheme.titleMedium?.copyWith(
              color: LightShadesAppColors.newsDateTextColor,
              fontSize: 16,
              fontStyle: FontStyle.italic,
            ),
          )
        ],
      ),
    );
  }
}
