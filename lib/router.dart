import 'package:flutter/material.dart';
import 'package:todo_bloc/constants.dart';
import 'package:todo_bloc/screens/add_todo.dart';
import 'package:todo_bloc/screens/edit_page.dart';
import 'package:todo_bloc/screens/home_page.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;

    switch (routeSettings.name) {
      case home:
        return MaterialPageRoute(builder: (context) => HomePage());
      case addtodo:
        return MaterialPageRoute(builder: (context) => AddTodoPage());
      case edittodo:
        return MaterialPageRoute(
            builder: (context) => EditTodoPage(todo: args));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Text('No routed defined'),
                ));
    }
  }
}
