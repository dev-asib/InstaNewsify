import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insta_newsify/core/constants/ColorPalette/light_shades/light_shades_app_colors.dart';
import 'package:insta_newsify/core/constants/asset_paths.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({
    super.key,
    this.width = 120.0,
    this.height = 120.0,
    this.placeholderWidget,
    this.placeholderSize = 120.0,
    this.placeholderColor = LightShadesAppColors.placeholderColor,
  });

  final double width;
  final double height;
  final Widget? placeholderWidget;
  final double placeholderSize;
  final Color placeholderColor;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AssetPaths.appLogo,
      width: width,
      height: height,
      fit: BoxFit.scaleDown,
      placeholderBuilder: (context) =>
          placeholderWidget ??
          Icon(
            Icons.error,
            size: placeholderSize,
            color: placeholderColor,
          ),
    );
  }
}
