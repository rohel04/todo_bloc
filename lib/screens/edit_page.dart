import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/bloc/todo_bloc_bloc.dart';
import 'package:todo_bloc/models/todo_model.dart';

class EditTodoPage extends StatefulWidget {
  dynamic todo;

  EditTodoPage({super.key, required this.todo});

  @override
  State<EditTodoPage> createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller_id.text = widget.todo.id;
    controller_task.text = widget.todo.task;
    controller_desc.text = widget.todo.description;
  }

  TextEditingController controller_id = TextEditingController();
  TextEditingController controller_task = TextEditingController();
  TextEditingController controller_desc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Update todo')),
      body: BlocListener<TodoBlocBloc, TodoBlocState>(
        listener: (context, state) {
          if (state is TodoLoaded) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Updated')));
          }
        },
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _inputField('ID', controller_id),
                _inputField('Task', controller_task),
                _inputField('Description', controller_desc),
                ElevatedButton(
                    onPressed: () {
                      var todo = Todo(
                          id: controller_id.text,
                          task: controller_task.text,
                          description: controller_desc.text);

                      context.read<TodoBlocBloc>().add(UpdateTodo(todo: todo));
                      Navigator.pop(context);
                    },
                    child: Text('Update Todo'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _inputField(String title, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$title',
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
        Container(
          height: 50,
          margin: EdgeInsets.only(bottom: 10),
          width: double.infinity,
          child: TextFormField(
            controller: controller,
          ),
        )
      ],
    );
  }
}
