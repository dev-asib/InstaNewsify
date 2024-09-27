import 'package:flutter/material.dart';
import 'package:insta_newsify/core/constants/ColorPalette/light_shades/light_shades_app_colors.dart';
import 'package:insta_newsify/core/utils/routes/app_navigation.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailScreen extends StatefulWidget {
  const NewsDetailScreen({super.key});

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  late final WebViewController _webViewController;
  bool _isLoading = true;

  void _initializeWebView() {
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() {
              _isLoading = true;
            });
          },
          onPageFinished: (url) {
            setState(() {
              _isLoading = false;
            });
          },
        ),
      );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final String? url = ModalRoute.of(context)?.settings.arguments as String?;
      _webViewController.loadRequest(Uri.parse(url ?? 'https://flutter.dev'));
    });
  }

  @override
  void initState() {
    super.initState();
    _initializeWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Stack(
        children: [
          WebViewWidget(controller: _webViewController),
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => AppNavigation.navigateToPreviewsScreen(context),
        icon: const Icon(
          Icons.arrow_back_ios,
          color: LightShadesAppColors.appBarBackButtonIconColor,
        ),
      ),
      forceMaterialTransparency: true,
      title: Text(
        "News Details",
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(color: LightShadesAppColors.appBarTitleTextColor),
      ),
    );
  }
}
