import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/bloc/todo_bloc_bloc.dart';
import 'package:todo_bloc/models/todo_model.dart';
import 'package:todo_bloc/widgets/input_field.dart' as InputFields;

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  TextEditingController controller_id = TextEditingController();
  TextEditingController controller_task = TextEditingController();
  TextEditingController controller_desc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add todo')),
      body: BlocListener<TodoBlocBloc, TodoBlocState>(
        listener: (context, state) {
          if (state is TodoLoaded) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Added')));
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

                      context.read<TodoBlocBloc>().add(AddTodo(todo: todo));
                      Navigator.pop(context);
                    },
                    child: Text('Add Todo'))
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
