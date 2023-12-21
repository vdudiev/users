import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users/domain/mixin/error_config_from_exception.dart';
import 'package:users/ui/app/di/app_scope.dart';

import 'package:users/ui/pages/user_page/bloc/user_event.dart';
import 'package:users/ui/pages/user_page/bloc/user_state.dart';
import 'package:users/ui/pages/user_page/user_model.dart';

/// Di для [UserBloc]
UserBloc createUserBloc({
  required BuildContext context,
  required int userId,
}) {
  final appDependencies = context.read<IAppScope>();
  final usermodel = UserModel(usersDataRepository: appDependencies.repository.usersDataRepository);
  return UserBloc(userModel: usermodel, useerId: userId);
}

/// [Bloc]-класс для бизнесс-логики экрана [UsersListPage]
class UserBloc extends Bloc<UserEvent, UserState> with ErrorConfigFromException {
  late final UserModel _userModel;
  final int useerId;

  UserBloc({
    required UserModel userModel,
    required this.useerId,
  }) : super(UserInitState()) {
    _userModel = userModel;
    on<UserLoadEvent>(_loadUser);
  }

  FutureOr<void> _loadUser(UserLoadEvent event, Emitter<UserState> emit) async {
    try {
      emit(UserLoadingState(user: _userModel.user));
      await _userModel.getUserById(id: useerId);
      emit(UserLoadedState(user: _userModel.user));
    } on DioException catch (e) {
      emit(UserErrorState(user: _userModel.user, errorConfig: getErrorconf(e)));
    }
    ;
  }
}
