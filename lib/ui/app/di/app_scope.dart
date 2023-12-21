import 'package:dio/dio.dart';
import 'package:users/service/http_client_service.dart';
import 'package:users/service/server_error_interceptor.dart';
import 'package:users/ui/app/di/repository_di_container.dart';
import 'package:users/ui/app/di/utils_di_container.dart';

class AppScope implements IAppScope {
  @override
  RepositoryDiContainer get repository => _repositoryDiContainer;
  @override
  UtilsDiContainer get utils => _utilsDiContainer;

  /// Зависимости-репозитории.
  late RepositoryDiContainer _repositoryDiContainer;

  /// Зависимости-утилит.
  late UtilsDiContainer _utilsDiContainer;

  ///

  /// инициализация di контейнера репозиторий
  Future<void> _initRepositoryDiContainer() async {
    final additionalInterceptors = <Interceptor>[ServerErrorInterceptor()];
    final httpClientService = HttpClientService.create(additionalInterceptors);
    _repositoryDiContainer = RepositoryDiContainer.create(dio: httpClientService.dioClient);
  }

  /// инициализация di контейнера репозиторий
  Future<void> _initUtilsDiContainer() async {
    _utilsDiContainer = UtilsDiContainer.create();
  }

  @override
  Future<void> initApp() async {
    await _initRepositoryDiContainer();
    await _initUtilsDiContainer();
  }
}

/// App dependencies.
abstract class IAppScope {
  /// Зависимости-репозитории.
  RepositoryDiContainer get repository;

  /// Зависимости-репозитории.
  UtilsDiContainer get utils;

  /// Колбэк инициализации приложения.
  Future<void> initApp();
}
