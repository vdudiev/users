import 'package:users/ui/pages/users_list_page/users_list_page.dart';

///Events страницы [UsersListPage]
abstract class UsersEvent {}

class UsersLoadEvent extends UsersEvent {}

class UsersNextPageEvent extends UsersEvent {}
