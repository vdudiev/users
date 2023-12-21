import 'package:flutter/material.dart';
import 'package:users/ui/app/di/app_scope.dart';
import 'package:users/users_app.dart';

void main() async {
  var scope = AppScope();
  await scope.initApp();
  runApp(UsersApp(
    appScope: scope,
  ));
}
