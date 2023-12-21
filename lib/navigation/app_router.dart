import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:users/ui/pages/home_page/home_page.dart';
import 'package:users/ui/pages/user_page/user_page.dart';
import 'package:users/ui/pages/users_list_page/users_list_page.dart';

class AppRouter {
  final _routes = RouteMap(routes: {
    RouteNames.homePage.value: (route) => const MaterialPage(child: HomePage()),
    RouteNames.usersListPage.value: (route) => const MaterialPage(child: UsersListPage()),
    RouteNames.userPage.value: (route) =>
        MaterialPage(child: UserPage(userId: int.parse(route.pathParameters['id'] ?? '0')))
  });

  RouteMap get routes => _routes;

  AppRouter._();

  static final _router = AppRouter._();

  /// Singleton instance of [AppRouter].
  factory AppRouter.instance() => _router;
}

enum RouteNames {
  homePage('/'),
  userPage('/details/:id'),
  usersListPage('/list');

  final String value;
  const RouteNames(this.value);
}
