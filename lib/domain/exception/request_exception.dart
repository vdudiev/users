import 'package:meta/meta.dart';
import 'package:users/domain/exception/core_exception.dart';

/// Ошибка выполения запроса.
@immutable
abstract interface class RequestException implements CoreException {
  @override
  final String? message;

  const RequestException({this.message});
}

/// Ошибка отсутствия интернета.
@immutable
class NoInternetException implements CoreException {
  @override
  String? get message => null;

  const NoInternetException();
}

/// Запрос упал по таймауту.
@immutable
class RequestTimeoutException implements RequestException {
  @override
  final String? message;

  const RequestTimeoutException({this.message});
}

/// Ошибка отсутствия запрашиваемого контента.
@immutable
class NotFoundException implements RequestException {
  @override
  final String? message;

  const NotFoundException({this.message});
}

/// Ошибка сервера.
@immutable
class ServerErrorException implements RequestException {
  @override
  final String? message;

  @override
  const ServerErrorException({this.message});
}
