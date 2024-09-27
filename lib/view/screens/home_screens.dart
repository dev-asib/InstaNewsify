import 'package:flutter/material.dart';
import 'package:insta_newsify/core/constants/ColorPalette/light_shades/light_shades_app_colors.dart';
import 'package:insta_newsify/core/constants/app_constants.dart';
import 'package:insta_newsify/core/utils/utils.dart';
import 'package:insta_newsify/view/widgets/home/news_card_widget.dart';
import 'package:insta_newsify/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeViewModel>(context, listen: false).fetchNews();
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);

    if (homeViewModel.isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (homeViewModel.errorMessage != null) {
      return Scaffold(
        appBar: _buildAppBar(),
        body: Center(
          child: Text(
            homeViewModel.errorMessage!,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: LightShadesAppColors.errorMessageTextColor,
            ),
          ),
        ),
      );
    }

    if (homeViewModel.newsModel?.articles == null ||
        homeViewModel.newsModel!.articles!.isEmpty) {
      return Scaffold(
        appBar: _buildAppBar(),
        body: const Center(
          child: Text(
            'No News Available',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildNewsList(homeViewModel),
    );
  }

  Widget _buildNewsList(HomeViewModel homeViewModel) {
    return ListView.builder(
      itemCount: homeViewModel.newsModel!.articles!.length,
      itemBuilder: (context, index) {
        final news = homeViewModel.newsModel!.articles![index];
        return NewsCardWidget(
          newsImageUrl: news.urlToImage ?? '',
          authorName: news.author ?? 'Unknown author',
          newsDescription: news.description ?? 'No description available',
          newsDate: Utils.dateTimeFormat(news.publishedAt ?? ''),
          newsUrl: news.url ?? '',
        );
      },
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      forceMaterialTransparency: true,
      centerTitle: true,
      title: Text(
        AppConstants.appName,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: LightShadesAppColors.appBarTitleTextColor,
        ),
      ),
    );
  }
}
