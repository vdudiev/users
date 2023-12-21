import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users/domain/entity/user/user_entity.dart';
import 'package:users/ui/common/basic_button.dart';
import 'package:users/ui/common/custom_error_widget.dart';
import 'package:users/ui/pages/users_list_page/bloc/users_bloc.dart';
import 'package:users/ui/pages/users_list_page/bloc/users_event.dart';
import 'package:users/ui/pages/users_list_page/bloc/users_state.dart';

class UsersListPage extends StatelessWidget {
  const UsersListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final usersbloc = createUsersBloc(context);
    usersbloc.add(UsersLoadEvent());
    return BlocProvider.value(
      value: usersbloc,
      child: Scaffold(
          appBar: AppBar(title: const Text('Список ползователей')),
          body: BlocConsumer<UsersBloc, UsersState>(
            builder: (context, state) {
              if (state is UsersLoadingState && state.usersList.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is UsersErrorState) {
                return CustomErrorWidget(
                  errorConfig: state.errorConfig,
                  onRefresh: () => () => usersbloc.add(UsersLoadEvent()),
                );
              }

              return SingleChildScrollView(
                  controller: usersbloc.scrollController,
                  child: Column(children: [
                    ...state.usersList.map((e) => _UserItemWidget(userEntity: e)).toList(),
                    if (state is UsersLoadingState)
                      const SizedBox(
                        height: 50,
                        child: Center(child: CircularProgressIndicator()),
                      )
                  ]));
            },
            listener: (BuildContext context, UsersState state) {
              if (state is UsersLoadedState) {
                WidgetsBinding.instance.addPostFrameCallback(
                  (timeStamp) => usersbloc.checkListVewExtent(),
                );
              }
            },
          )),
    );
  }
}

class _UserItemWidget extends StatelessWidget {
  final UserEntity userEntity;
  const _UserItemWidget({required this.userEntity});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // contentPadding: const EdgeInsets.symmetric(vertical: 30),
      leading: Container(
          height: 50,
          width: 50,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
          child: Image.network(
            userEntity.avatar,
            fit: BoxFit.cover,
          )),
      title: Text('${userEntity.firstName} ${userEntity.lastName}'),
      subtitle: Text(userEntity.email),
    );
  }
}
