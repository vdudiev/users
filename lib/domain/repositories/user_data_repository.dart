import 'package:users/domain/entity/user/user_entity.dart';

/// Интерфейс Репозитрия работы с данными пользователей
abstract interface class IUsersDataRepository {
  /// Колбэк получения списка пользователей
  Future<List<UserEntity>> getUsers({required int page});

  /// Колбэк получения списка пользователей
  Future<UserEntity> getUserById(int id);
}
