import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:users/domain/repositories/user_data_repository.dart';
import 'package:users/domain/repositories/user_data_repository_impl.dart';

/// Контейнер зависимостей-репозиториев.
@immutable
class RepositoryDiContainer {
  /// Репозиторий для работы со списком пользователей
  final IUsersDataRepository usersDataRepository;

  const RepositoryDiContainer._({required this.usersDataRepository});

  factory RepositoryDiContainer.create({
    required Dio dio,
  }) =>
      RepositoryDiContainer._(usersDataRepository: UsersDataRepositoryImpl(dio));
}
