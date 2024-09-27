import 'package:flutter/material.dart';
import 'package:insta_newsify/core/theme/app_theme.dart';
import 'package:insta_newsify/core/utils/routes/app_routes.dart';
import 'package:insta_newsify/core/utils/routes/routes_name.dart';
import 'package:insta_newsify/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class InstaNewsify extends StatelessWidget {
  const InstaNewsify({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeViewModel()),
      ],
      child: MaterialApp(
        initialRoute: RoutesName.splashScreen,
        onGenerateRoute: AppRoutes.generateRoute,
        theme: AppTheme.buildLightThemeData(),
        darkTheme: AppTheme.buildDarkThemeData(),
        themeMode: ThemeMode.system,
      ),
    );
  }
}
