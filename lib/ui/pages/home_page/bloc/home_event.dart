import 'package:flutter/material.dart';
import 'package:users/ui/pages/home_page/home_page.dart';

///Events страницы [HomePage]
abstract class HomeEvent {}

class SearchEvent extends HomeEvent {
  final BuildContext context;
  SearchEvent({required this.context});
}
