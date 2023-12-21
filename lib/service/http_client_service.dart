import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:users/api/rest_api_urls.dart';

/// Таймаут в минутах.
const _timeoutMinutes = 10;

/// Клиент создания объектов выполнения HTTP запросов.
@immutable
class HttpClientService {
  /// Клиент RestAPI запросов.
  final Dio dioClient;

  const HttpClientService._({
    required this.dioClient,
  });

  /// Создаёт класс-обёртку, содержащую клиент запросов.
  ///
  /// Опционально можно передать список интерсепторов запросов [additionalInterceptors].
  factory HttpClientService.create(Iterable<Interceptor>? additionalInterceptors) {
    const timeout = Duration(seconds: _timeoutMinutes * 60);
    final dio = Dio();
    dio.options
      ..baseUrl = RestApiUrls.baseUrl
      ..connectTimeout = timeout
      ..receiveTimeout = timeout
      ..sendTimeout = timeout;

    if (additionalInterceptors != null) dio.interceptors.addAll(additionalInterceptors);

    /// Интерсептор для логов запросов
    dio.interceptors.add(
      AwesomeDioInterceptor(
        // Disabling headers and timeout would minimize the logging output.
        // Optional, defaults to true
        logRequestTimeout: false,
        logRequestHeaders: false,
        logResponseHeaders: false,

        // Optional, defaults to the 'log' function in the 'dart:developer' package.
        logger: debugPrint,
      ),
    );

    return HttpClientService._(dioClient: dio);
  }
}
