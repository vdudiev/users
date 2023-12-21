import 'package:users/domain/entity/user/user_entity.dart';
import 'package:users/domain/repositories/user_data_repository.dart';

/// Бизнес-модель экрана списка пользователей
class UsersModel {
  final List<UserEntity> _users = [];
  final IUsersDataRepository usersDataRepository;

  UsersModel({required this.usersDataRepository});
  List<UserEntity> get users => _users;

  /// метод получения одной страницы списка данных
  Future<void> getUsersByPage({required int page}) async {
    var newUsers = await usersDataRepository.getUsers(page: page);
    _users.addAll(newUsers);
  }

  void clearUsersList() {
    _users.clear();
  }
}
