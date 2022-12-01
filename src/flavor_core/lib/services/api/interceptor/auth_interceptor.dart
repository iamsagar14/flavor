// 📦 Package imports:
import 'package:dio/dio.dart';

// 🌎 Project imports:
import 'package:flavor_core/services/locator.dart';
import 'package:flavor_core/services/managers/token_manager.dart';

class AuthInterceptor extends QueuedInterceptor {
  final TokenManager _tokenRepository = locator.get<TokenManager>();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (!options.requiresAuthenticationToken) {
      options.headers.remove('requires_token');
      return handler.next(options);
    }

    var token = _tokenRepository.currentToken;
    var refreshed = true;
    if (token == null) {
      throw UnimplementedError();
    } else {
      if (token.refreshTokenExpired) {
        throw UnimplementedError();
      } else if (token.accessTokenExpired) {
        try {
          refreshed = await _tokenRepository.regenerateAccessToken();
          token = _tokenRepository.currentToken;
        } catch (e) {
          rethrow;
        }
      }
      if (refreshed && token != null && !token.accessTokenExpired) {
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
