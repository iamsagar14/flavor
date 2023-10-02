// ignore_for_file: public_member_api_docs, sort_constructors_first

// 🌎 Project imports:

import 'package:dio/dio.dart';
import 'package:{{project_name.snakeCase()}}/app/models/token.dart';
import 'package:{{project_name.snakeCase()}}/services/api/endpoint.dart';
import 'package:{{project_name.snakeCase()}}/services/api/interceptor/error_interceptor.dart';
import 'package:{{project_name.snakeCase()}}/services/locator.dart';
import 'package:{{project_name.snakeCase()}}/services/manager/storage_manager.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class TokenManager {
  Token? _currentToken;
  final StorageManager _storageManager;

  TokenManager({
    required StorageManager storageManager,
  }) : _storageManager = storageManager {
    _storageManager.token.then((token) => _currentToken = token);
  }
  Token? get currentToken => _currentToken;

  set currentToken(Token? token) {
    if (token != null) {
      _currentToken = token;
      _storageManager.saveToken(token);
    } else {
      _storageManager.removeToken();
    }
  }

  void forceLogout() {
    Get.find<TokenController>().token.value = null;
    // Get.rootDelegate.offNamed(Routes.WELCOME);
  }

  Future<bool> refreshSessionTokens() async {
    try {
      final refreshDio = Dio(
        BaseOptions(
          baseUrl: Endpoint.baseUrl,
          responseType: ResponseType.json,
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
      final response = await refreshDio.post(
        Endpoint.refreshToken,
        data: {
          "refresh": currentToken?.refresh,
        },
      );
      if (response.statusCode == 200) {
        final access = response.data["access"];
        currentToken = _currentToken?.copyWith(access: access);
        return true;
      } else {
        return false;
      }
    } catch (_) {
      rethrow;
    }
  }
}

class TokenController extends GetxService {
  final _tokenManager = locator.get<TokenManager>();

  // ignore: unnecessary_cast
  Rx<Token?> token = (null as Token?).obs;
  @override
  void onInit() {
    token.value = _tokenManager.currentToken;
    token.listen((val) {
      _tokenManager.currentToken = val;
    });
    super.onInit();
  }
}
