import 'package:flutter/material.dart';
import 'package:insta_newsify/core/constants/ColorPalette/light_shades/light_shades_app_colors.dart';
import 'package:insta_newsify/core/constants/app_constants.dart';
import 'package:insta_newsify/core/utils/routes/app_navigation.dart';
import 'package:insta_newsify/core/utils/utils.dart';
import 'package:insta_newsify/view/widgets/splash/app_logo_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _moveToNextScreen() async {
    try {
      await Future.delayed(const Duration(seconds: 3));
      if (mounted) {
        AppNavigation.navigateToHomeScreen(context);
      }
    } catch (e) {
      debugPrint('Error during splash_screen_navigation: $e');
      if (mounted) {
        Utils.flushBarErrorMessage(
            context, 'An error occurred! Please try again.');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              const AppLogoWidget(),
              Text(
                AppConstants.appName,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: LightShadesAppColors.appNameTextColor),
              ),
              const Spacer(),
              const CircularProgressIndicator(),
              const SizedBox(height: 16),
              const Text(
                "Version 1.0.0",
                style: TextStyle(
                  color: LightShadesAppColors.versionTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
