// 📦 Package imports:

import 'package:dio/dio.dart';
import 'package:{{project_name.snakeCase()}}/services/api/interceptor/dio_errors.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.connectionError:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw TimeoutException(err.requestOptions);
      case DioExceptionType.badResponse:
        if (err.response?.data is Map<String, dynamic>?) {
          Map<String, dynamic>? serverResponse = err.response?.data;
          if (serverResponse != null) {
            if (serverResponse["message"] != null) {
              if (serverResponse["message"] is String) {
                if (serverResponse["message"].isNotEmpty) {
                  throw CustomServerException(
                      err.requestOptions, serverResponse["message"]);
                }
              }
              if (serverResponse["message"] is List) {
                if (serverResponse["message"].isNotEmpty) {
                  throw CustomServerException(
                      err.requestOptions, serverResponse["message"].first);
                }
              }
            } else if (serverResponse["detail"] != null) {
              if (serverResponse["detail"] is String) {
                if (serverResponse["detail"].isNotEmpty) {
                  throw CustomServerException(
                      err.requestOptions, serverResponse["detail"]);
                }
              }
            }
          }
        }
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(err.requestOptions);
          case 401:
            throw UnauthorizedException(err.requestOptions);
          case 403:
            throw ForbiddenException(err.requestOptions);
          case 404:
            throw NotFoundException(err.requestOptions);
          case 409:
            throw ConflictException(err.requestOptions);
          case 500:
            throw InternalServerErrorException(err.requestOptions);
        }
        break;
      case DioExceptionType.cancel:
      case DioExceptionType.badCertificate:
        break;
      case DioExceptionType.unknown:
        throw OtherException(err.requestOptions);
    }

    return handler.next(err);
  }
}
