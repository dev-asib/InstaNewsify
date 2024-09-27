import 'package:insta_newsify/core/utils/app_logger.dart';
import 'package:insta_newsify/data/models/news_model.dart';
import 'package:insta_newsify/data/sources/remote/remote_service.dart';

class NewsRepository {
  final RemoteService _remoteService;

  NewsRepository({RemoteService? remoteService})
      : _remoteService = remoteService ?? RemoteService();

  Future<NewsModel?> fetchNews() async {
    try {
      NewsModel? newsModel = await _remoteService.getNewsRequest();

      if (newsModel != null) {
        AppLogger.infoLog("News fetched Successfully.");
        return newsModel;
      } else {
        AppLogger.warningLog("No news data found.");
        return null;
      }
    } catch (e) {
      AppLogger.errorLog(
          "Error fetching news from repository: ${e.toString()}");
      return null;
    }
  }
}
