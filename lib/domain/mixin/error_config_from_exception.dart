import 'package:dio/dio.dart';
import 'package:users/domain/entity/error_config.dart';
import 'package:users/domain/exception/request_exception.dart';

mixin ErrorConfigFromException {
  ErrorConfig getErrorconf(DioException e) {
    final ErrorConfig errorConfig;

    switch (e.error) {
      case RequestTimeoutException():
        errorConfig = ErrorConfig.timeoutError();
        break;
      case ServerErrorException():
        errorConfig = ErrorConfig.serverError();
        break;
      case NoInternetException():
        errorConfig = ErrorConfig.noInternetError();
        break;

      case NotFoundException():
        errorConfig = ErrorConfig.notFoundException();
        break;
      default:
        errorConfig = ErrorConfig.defaultError();
    }
    return errorConfig;
  }
}
