import 'package:users/domain/entity/user/user_entity.dart';
import 'package:users/domain/repositories/user_data_repository.dart';

/// Бизнес-модель экрана пользователя
class UserModel {
  UserEntity? _user;
  final IUsersDataRepository usersDataRepository;

  UserModel({required this.usersDataRepository});
  UserEntity? get user => _user;

  /// метод получения пользователя по id
  Future<void> getUserById({required int id}) async {
    var newUser = await usersDataRepository.getUserById(id);
    _user = newUser;
  }

  void clearUserData() {
    _user = null;
  }
}
