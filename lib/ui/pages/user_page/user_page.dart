import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:users/ui/common/custom_error_widget.dart';
import 'package:users/ui/pages/user_page/bloc/user_bloc.dart';
import 'package:users/ui/pages/user_page/bloc/user_event.dart';
import 'package:users/ui/pages/user_page/bloc/user_state.dart';

class UserPage extends StatelessWidget {
  final int userId;
  const UserPage({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    final userbloc = createUserBloc(context: context, userId: userId);
    userbloc.add(UserLoadEvent());
    return BlocProvider.value(
      value: userbloc,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Пользователь: $userId'),
          ),
          body: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserLoadingState) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is UserErrorState) {
                return CustomErrorWidget(
                  errorConfig: state.errorConfig,
                  onRefresh: () => userbloc.add(UserLoadEvent()),
                );
              }
              if (state is UserLoadedState) {
                return Center(
                    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                      height: 100,
                      width: 100,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
                      child: Image.network(
                        state.user?.avatar ?? '',
                        fit: BoxFit.cover,
                      )),
                  const SizedBox(height: 30),
                  Text('${state.user?.firstName ?? ''} ${state.user?.lastName ?? ''}'),
                  const SizedBox(height: 10),
                  Text('Email: ${state.user?.email ?? ''}')
                ]));
              }
              return const SizedBox();
            },
          )),
    );
  }
}
