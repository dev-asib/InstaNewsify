import 'dart:convert';
import 'package:http/http.dart';
import 'package:insta_newsify/core/constants/api_constants.dart';
import 'package:insta_newsify/core/utils/app_logger.dart';
import 'package:insta_newsify/data/models/news_model.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<NewsModel?> getNewsRequest() async {
    final Client client = http.Client();

    try {
      final Uri uri = Uri.parse(ApiConstants.everything);
      AppLogger.requestLog(uri.toString(), {});
      final Response response = await client.get(uri);

      if (response.statusCode == 200) {
        AppLogger.responseLog(
          uri.toString(),
          response.statusCode,
          response.body,
          true,
        );

        var responseData = jsonDecode(response.body);
        if (responseData is Map<String, dynamic>) {
          return NewsModel.fromJson(responseData);
        } else {
          AppLogger.responseLog(
            uri.toString(),
            response.statusCode,
            response.body,
            false,
          );
          return null;
        }
      } else {
        AppLogger.responseLog(
          uri.toString(),
          response.statusCode,
          response.body,
          false,
        );
        return null;
      }
    } catch (e) {
      AppLogger.responseLog(
        "Error Fetching News",
        -1,
        e.toString(),
        false,
        e,
      );
      return null;
    } finally {
      client.close();
    }
  }
}
