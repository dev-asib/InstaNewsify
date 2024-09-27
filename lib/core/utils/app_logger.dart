import 'package:logger/logger.dart';

class AppLogger {
  static final Logger logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 5,
      lineLength: 80,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
    ),
  );

  static void requestLog(
      String url, Map<String, dynamic> body) {
    logger.i('''
      [Request]
      Url: $url
      Body: $body
      ''');
  }

  static void infoLog(String message){
    logger.i('[INFO] $message');
  }

  static void warningLog(String message){
    logger.w('[WARNING] $message');
  }

  static void errorLog(String message, [dynamic error, StackTrace? stackTrace]){
    logger.e('[ERROR] $message, $error, $stackTrace');
  }

  static void responseLog(
      String url, int statusCode, dynamic responseBody, bool isSuccess,
      [dynamic error]) {
    String message = '''
      [Response]
      Url: $url
      Status Code: $statusCode
      Response Body: $responseBody
      ''';

    if (error != null) {
      message += 'Error: $error\n';
    }

    if (isSuccess) {
      logger.i(message);
    } else {
      logger.e(message);
    }
  }
}
