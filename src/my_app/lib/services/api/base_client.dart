// 📦 Package imports:
import 'package:dio/dio.dart';
import 'package:flavor_core/config/config.dart';
import 'package:flavor_core/services/api/interceptor/auth_interceptor.dart';
import 'package:flavor_core/services/api/interceptor/error_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// 🌎 Project imports:

class BaseClient {
  final Config _config;
  BaseClient({
    required Config config,
  }) : _config = config;

  Future<Dio> createDio() async {
    Dio dio = Dio();

    dio.options = BaseOptions(
      baseUrl: _config.baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 10),
      contentType: 'application/json',
      responseType: ResponseType.json,
    );

    dio.interceptors.addAll(
      [
        AuthInterceptor(),
        ErrorInterceptor(),
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      ],
    );
    return dio;
  }
}
