import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/bloc/todo_bloc_bloc.dart';
import 'package:todo_bloc/constants.dart';
import 'package:todo_bloc/models/todo_model.dart';
import 'package:todo_bloc/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBlocBloc()..add(LoadTodo(todos: [])),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouterGenerator.generateRoute,
        initialRoute: home,
        theme: ThemeData(
            primarySwatch: Colors.blueGrey,
            appBarTheme: AppBarTheme(color: Colors.black)),
      ),
    );
  }
}
