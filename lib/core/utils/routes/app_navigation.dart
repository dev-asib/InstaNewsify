import 'package:flutter/cupertino.dart';
import 'package:insta_newsify/core/utils/app_logger.dart';
import 'package:insta_newsify/core/utils/routes/routes_name.dart';

class AppNavigation {
  static void navigateToSplashScreen(BuildContext context,
      {dynamic arguments}) {
    try {
      Navigator.pushReplacementNamed(context, RoutesName.splashScreen,
          arguments: arguments);
    } catch (e) {
      AppLogger.logger.e(("Error navigation to splash screen $e"));
    }
  }

  static void navigateToHomeScreen(BuildContext context, {dynamic arguments}) {
    try {
      Navigator.pushReplacementNamed(context, RoutesName.homeScreen,
          arguments: arguments);
    } catch (e) {
      AppLogger.logger.e(("Error navigation to home screen $e"));
    }
  }

  static void navigateToNewsDetailScreen(BuildContext context,
      {dynamic arguments}) {
    try {
      Navigator.pushNamed(context, RoutesName.newsDetailScreen,
          arguments: arguments);
    } catch (e) {
      AppLogger.logger.e(("Error navigation to article detail screen $e"));
    }
  }

  static void navigateToPreviewsScreen(BuildContext context) {
    try {
      Navigator.pop(context);
    } catch (e) {
      AppLogger.logger.e(("Error navigation to article detail screen $e"));
    }
  }
}
