import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users/domain/mixin/error_config_from_exception.dart';
import 'package:users/ui/app/di/app_scope.dart';
import 'package:users/ui/pages/users_list_page/bloc/users_event.dart';
import 'package:users/ui/pages/users_list_page/bloc/users_state.dart';
import 'package:users/ui/pages/users_list_page/users_list_page.dart';
import 'package:users/ui/pages/users_list_page/users_model.dart';

/// Di для [UsersBloc]
UsersBloc createUsersBloc(BuildContext context) {
  final appDependencies = context.read<IAppScope>();
  final usersmodel = UsersModel(usersDataRepository: appDependencies.repository.usersDataRepository);
  return UsersBloc(usersModel: usersmodel);
}

/// [Bloc]-класс для бизнесс-логики экрана [UsersListPage]
class UsersBloc extends Bloc<UsersEvent, UsersState> with ErrorConfigFromException {
  final _scrollController = ScrollController();
  ScrollController get scrollController => _scrollController;

  late final UsersModel _usersModel;
  int _page = 1;
  final int _limit = 6;
  UsersBloc({required UsersModel usersModel}) : super(UsersInitState()) {
    _setListenerforController();
    _usersModel = usersModel;

    /// Начальная загрузка спика
    on<UsersLoadEvent>(_loadUsers);

    /// Событие получения следующей страницы списка пользователей
    on<UsersNextPageEvent>(_loadNexPage);
  }

  /// метод установки слушателя [ScrollController] для активации события загрузки следующей страницы
  void _setListenerforController() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        add(UsersNextPageEvent());
      }
    });
  }

  /// Если скроллвью меньше экрана, то подгружаем страницы отсюда
  void checkListVewExtent() {
    if (_scrollController.hasClients) {
      if (_scrollController.position.extentAfter == 0 && _scrollController.position.extentBefore == 0) {
        add(UsersNextPageEvent());
      }
    }
  }

  FutureOr<void> _loadUsers(UsersLoadEvent event, Emitter<UsersState> emit) async {
    _page = 1;
    _usersModel.clearUsersList;
    emit(UsersLoadingState(usersList: _usersModel.users));
    try {
      await _usersModel.getUsersByPage(page: _page);
      emit(UsersLoadedState(usersList: _usersModel.users));
    } on DioException catch (e) {
      emit(UsersErrorState(usersList: _usersModel.users, errorConfig: getErrorconf(e)));
    }
    // _checkListVewExtent();
  }

  FutureOr<void> _loadNexPage(UsersNextPageEvent event, Emitter<UsersState> emit) async {
    try {
      if (_usersModel.users.length == _limit * _page) {
        emit(UsersLoadingState(usersList: _usersModel.users));
        _page++;
        await _usersModel.getUsersByPage(page: _page);
        emit(UsersLoadedState(usersList: _usersModel.users));
      }
    } on DioException catch (e) {
      emit(UsersErrorState(usersList: _usersModel.users, errorConfig: getErrorconf(e)));
    }
  }
}
