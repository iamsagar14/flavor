// 📦 Package imports:
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// 🌎 Project imports:
import 'package:flavor_core/app/data/models/token.dart';
import 'package:flavor_core/app/data/storage/get_storage.dart';
import 'package:flavor_core/services/api/endpoint.dart';
import 'package:flavor_core/services/api/interceptor/error_interceptor.dart';

class TokenManager {
  Token? _currentToken;

  TokenRepository() {
    _currentToken = CoreStorage.readToken;
  }

  Token? get currentToken => _currentToken;

  set currentToken(Token? token) {
    if (token != null) {
      _currentToken = token;
      CoreStorage.saveToken(token);
    } else {
      CoreStorage.storage?.remove("token");
    }
  }

  bool get hasToken => currentToken != null;

  Future<bool> regenerateAccessToken() async {
    try {
      final refreshDio = Dio(
        BaseOptions(
          baseUrl: Endpoint.baseUrl,
          responseType: ResponseType.plain,
        ),
      );
      refreshDio.interceptors.addAll(
        [
          ErrorInterceptor(),
          PrettyDioLogger(
            responseBody: true,
            error: true,
            compact: true,
            maxWidth: 90,
          )
        ],
      );
      throw UnimplementedError();
    } catch (_) {
      rethrow;
    }
  }
}
