import 'package:flutter/material.dart';
import 'package:insta_newsify/core/utils/app_logger.dart';
import 'package:insta_newsify/core/utils/routes/routes_name.dart';
import 'package:insta_newsify/view/screens/news_detail_screen.dart';
import 'package:insta_newsify/view/screens/home_screens.dart';
import 'package:insta_newsify/view/screens/splash_screen.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashScreen:
        return _buildRoute(const SplashScreen(), settings);
      case RoutesName.homeScreen:
        return _buildRoute(const HomeScreens(), settings);
        case RoutesName.newsDetailScreen:
        return _buildRoute(const NewsDetailScreen(), settings);
      default:
        AppLogger.logger.e(("No route defined for ${settings.name}"));
        return _buildRoute(
          const Scaffold(
            body: Center(
              child: Text("No route defined."),
            ),
          ),
          settings,
        );
    }
  }

  static MaterialPageRoute _buildRoute(Widget screen, RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => screen, settings: settings);
  }
}
