import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routemaster/routemaster.dart';
import 'package:users/navigation/app_router.dart';
import 'package:users/ui/pages/home_page/bloc/home_event.dart';
import 'package:users/ui/pages/home_page/bloc/home_state.dart';
import 'package:users/ui/pages/home_page/home_page.dart';

/// Di для [HomeBloc]
HomeBloc createHomeBloc() {
  return HomeBloc();
}

/// [Bloc]-класс для бизнесс-логики экрана [HomePage]
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(InitHomeState()) {
    on<SearchEvent>(_searchEvent);
  }

  final TextEditingController _textEditingController = TextEditingController();

  TextEditingController get textEditingController => _textEditingController;

  /// Метод события поиска пользователся по id
  FutureOr<void> _searchEvent(SearchEvent event, Emitter<HomeState> emit) {
    if (_textEditingController.text.isEmpty) {
      emit(EmptyIdState());
    } else {
      var router = Routemaster.of(event.context);
      router.push('/details/${_textEditingController.text}');
    }
  }

  /// Метод события нажатия на кнопку "Список"
  void openListEvent(BuildContext context) {
    var router = Routemaster.of(context);
    router.push(RouteNames.usersListPage.value);
  }

  /// метод для ввода id
  void onIdChange(String value) {
    var intVal = int.tryParse(value);
    if (intVal != null && (intVal > 0 && intVal <= 30)) {
      _textEditingController.text = value;
    } else {
      _textEditingController.text = '';
    }
    ;
  }
}
