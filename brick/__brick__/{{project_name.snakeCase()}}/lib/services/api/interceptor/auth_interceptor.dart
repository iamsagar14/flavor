// 📦 Package imports:
import 'package:dio/dio.dart';
import 'package:{{project_name.snakeCase()}}/config/config.dart';
import 'package:{{project_name.snakeCase()}}/services/locator.dart';
import 'package:{{project_name.snakeCase()}}/services/manager/token_manager.dart';

class AuthInterceptor extends QueuedInterceptor {
  final TokenManager _tokenManager = locator.get<TokenManager>();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.baseUrl = locator.get<Config>().baseUrl;
    if (!options.requiresAuthenticationToken) {
      options.headers.remove('requires_token');
      return handler.next(options);
    }

    var token = _tokenManager.currentToken;
    var refreshed = true;

    if (token == null) {
      _tokenManager.forceLogout();
    } else {
      if (token.refreshExpired) {
        _tokenManager.forceLogout();
      } else if (token.accessExpired) {
        try {
          refreshed = await _tokenManager.refreshSessionTokens();
          token = _tokenManager.currentToken;
        } catch (_) {
          refreshed = false;
        }
      }
      if (refreshed && token != null) {
        options.setAuthenticationHeader(token: token.access);
        return handler.next(options);
      }
    }
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }
}

extension AuthRequestOptions on RequestOptions {
  bool get requiresAuthenticationToken => headers['requires_token'] == true;
  void setAuthenticationHeader({required final String token}) =>
      headers['Authorization'] = 'Bearer $token';
}
