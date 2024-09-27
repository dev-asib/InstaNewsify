import 'package:flutter/material.dart';
import 'package:insta_newsify/core/constants/asset_paths.dart';
import 'package:insta_newsify/core/utils/routes/app_navigation.dart';
import 'package:insta_newsify/view/widgets/home/news_card_footer.dart';
import 'package:insta_newsify/view/widgets/home/news_image.dart';

class NewsCardWidget extends StatelessWidget {
  const NewsCardWidget({
    super.key,
    required this.newsImageUrl,
    required this.authorName,
    required this.newsDescription,
    required this.newsDate,
    required this.newsUrl,
  });

  final String newsImageUrl;
  final String authorName;
  final String newsDescription;
  final String newsDate;
  final String newsUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigation.navigateToNewsDetailScreen(
          context,
          arguments: newsUrl.toString(),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4.0),
        child: Card(
          elevation: 3,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Column(
            children: [
              NewsImage(
                newsImageUrl: newsImageUrl.isNotEmpty ? newsImageUrl : '',
                placeholderWidget: Image.asset(AssetPaths.errorImage),
              ),
              const SizedBox(height: 16),
              NewsCardFooter(
                authorName: authorName,
                newsDescription: newsDescription,
                newsDate: newsDate,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
