import 'package:users/domain/entity/error_config.dart';
import 'package:users/domain/entity/user/user_entity.dart';
import 'package:users/ui/pages/users_list_page/users_list_page.dart';

///States страницы [UsersListPage]
abstract class UsersState {
  final List<UserEntity> usersList;

  UsersState({required this.usersList});
}

class UsersInitState extends UsersState {
  UsersInitState() : super(usersList: []);
}

class UsersLoadingState extends UsersState {
  UsersLoadingState({required super.usersList});
}

class UsersErrorState extends UsersState {
  final ErrorConfig errorConfig;
  UsersErrorState({
    required super.usersList,
    required this.errorConfig,
  });
}

class UsersLoadedState extends UsersState {
  UsersLoadedState({required super.usersList});
}
