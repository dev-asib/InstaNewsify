import 'package:flutter/material.dart';
import 'package:insta_newsify/core/utils/app_logger.dart';
import 'package:insta_newsify/data/models/news_model.dart';
import 'package:insta_newsify/data/repository/news_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final NewsRepository _newsRepository;

  NewsModel? _newsModel;
  String? _errorMessage;
  bool _isLoading = false;

  NewsModel? get newsModel => _newsModel;

  String? get errorMessage => _errorMessage;

  bool get isLoading => _isLoading;

  HomeViewModel({NewsRepository? newsRepository})
      : _newsRepository = newsRepository ?? NewsRepository();

  Future<void> fetchNews() async {
    _setLoading(true);
    _errorMessage = null;
    try {
      _newsModel = await _newsRepository.fetchNews();
      if (_newsModel != null) {
        AppLogger.infoLog("News Successfully fetched in HomeViewModel.");
      } else {
        _errorMessage = "Failed to fetch news data.";
        AppLogger.warningLog(_errorMessage!);
      }
    } catch (e, stackTrace) {
      _errorMessage = "Error in HomeViewModel: $e";
      AppLogger.errorLog(_errorMessage!, e, stackTrace);
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
