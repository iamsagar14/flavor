// 📦 Package imports:
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// 🌎 Project imports:
import 'package:flavor_core/services/api/endpoint.dart';
import 'package:flavor_core/services/api/interceptor/auth_interceptor.dart';
import 'package:flavor_core/services/api/interceptor/error_interceptor.dart';

class BaseClient {
  late final Dio _dio = _createDio();

  Dio get dio => _dio;
  Dio _createDio() {
    Dio dio = Dio();
    dio.options = BaseOptions(
      baseUrl: Endpoint.baseUrl,
      contentType: 'application/json',
      responseType: ResponseType.plain,
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
        )
      ],
    );
    return dio;
  }
}
