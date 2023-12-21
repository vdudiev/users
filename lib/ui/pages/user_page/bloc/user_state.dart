import 'package:users/domain/entity/error_config.dart';
import 'package:users/domain/entity/user/user_entity.dart';
import 'package:users/ui/pages/user_page/user_page.dart';

///States страницы [UserPage]
abstract class UserState {
  final UserEntity? user;

  UserState({required this.user});
}

class UserInitState extends UserState {
  UserInitState() : super(user: null);
}

class UserLoadingState extends UserState {
  UserLoadingState({required super.user});
}

class UserErrorState extends UserState {
  final ErrorConfig errorConfig;
  UserErrorState({
    required super.user,
    required this.errorConfig,
  });
}

class UserLoadedState extends UserState {
  UserLoadedState({required super.user});
}
