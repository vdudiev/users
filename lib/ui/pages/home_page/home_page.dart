import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:users/ui/common/basic_button.dart';

import 'package:users/ui/pages/home_page/bloc/home_bloc.dart';
import 'package:users/ui/pages/home_page/bloc/home_event.dart';
import 'package:users/ui/pages/home_page/bloc/home_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var homebloc = createHomeBloc();
    return BlocProvider.value(
      value: homebloc,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('число 1-30'),
              const SizedBox(height: 20),
              TextField(
                  onChanged: homebloc.onIdChange,
                  controller: homebloc.textEditingController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
                  decoration: InputDecoration(
                      labelText: 'Введите id',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)))),
              const SizedBox(height: 20),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) => Text(
                  state is EmptyIdState ? 'Заполните поле id' : '',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                      child: BasicButton(
                          onTap: () => homebloc.add(SearchEvent(context: context)), title: 'Найти')),
                  const SizedBox(width: 20),
                  Expanded(child: BasicButton(onTap: () => homebloc.openListEvent(context), title: 'Список')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
