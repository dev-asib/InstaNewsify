import 'package:flutter/material.dart';
import 'package:insta_newsify/core/constants/ColorPalette/light_shades/light_shades_app_colors.dart';

class NewsImage extends StatelessWidget {
  const NewsImage({
    super.key,
    required this.newsImageUrl,
    this.imageHeight = 180,
    this.imageWidth = double.maxFinite,
    this.borderRadiusTopRight = 16,
    this.borderRadiusTopLeft = 16,
    this.borderRadiusBottomRight = 0,
    this.borderRadiusBottomLeft = 0,
    this.fit = BoxFit.fill,
    this.errorWidget = const Center(
      child: Icon(
        Icons.error,
        color: LightShadesAppColors.errorWidgetColor,
      ),
    ),
    this.placeholderWidget = const Center(
      child: CircularProgressIndicator(),
    ),
  });

  final String newsImageUrl;
  final double imageHeight;
  final double imageWidth;

  final double borderRadiusTopRight;
  final double borderRadiusTopLeft;
  final double borderRadiusBottomRight;
  final double borderRadiusBottomLeft;

  final BoxFit fit;

  final Widget errorWidget;
  final Widget placeholderWidget;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(borderRadiusTopLeft),
        topRight: Radius.circular(borderRadiusTopRight),
        bottomLeft: Radius.circular(borderRadiusBottomLeft),
        bottomRight: Radius.circular(borderRadiusBottomRight),
      ),
      child: SizedBox(
        height: imageHeight,
        width: imageWidth,
        child: Image.network(
          newsImageUrl,
          fit: fit,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return placeholderWidget;
          },
          errorBuilder: (BuildContext context, error, stackTrace) {
            return errorWidget;
          },
        ),
      ),
    );
  }
}
