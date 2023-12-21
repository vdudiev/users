// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

import 'package:users/ui/app/di/app_scope.dart';

class UsersApp extends StatelessWidget {
  final IAppScope appScope;
  const UsersApp({
    Key? key,
    required this.appScope,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<IAppScope>.value(
      value: appScope,
      child: MaterialApp.router(
        routerDelegate:
            RoutemasterDelegate(routesBuilder: (context) => context.read<IAppScope>().utils.router.routes),
        routeInformationParser: const RoutemasterParser(),
      ),
    );
  }
}
