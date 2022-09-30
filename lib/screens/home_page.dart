import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/bloc/todo_bloc_bloc.dart';
import 'package:todo_bloc/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo with Bloc'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, addtodo);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Container(
        child: BlocBuilder<TodoBlocBloc, TodoBlocState>(
          builder: (context, state) {
            if (state is TodoBlocInitial) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TodoLoaded) {
              return ListView.builder(
                  itemCount: state.todos.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, edittodo,
                            arguments: state.todos[index]);
                      },
                      child: ListTile(
                        title: Text('${state.todos[index].task}'),
                        trailing: IconButton(
                          onPressed: () {
                            context
                                .read<TodoBlocBloc>()
                                .add(DeleteTodo(todo: state.todos[index]));
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ),
                    );
                  });
            } else {
              return Text('Something is wrong');
            }
          },
        ),
      ),
    );
  }
}
