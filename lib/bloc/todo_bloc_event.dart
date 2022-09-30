part of 'todo_bloc_bloc.dart';

abstract class TodoBlocEvent extends Equatable {
  const TodoBlocEvent();
}

class LoadTodo extends TodoBlocEvent {
  List<Todo> todos = [];

  LoadTodo({required this.todos});

  @override
  List<Object?> get props => [todos];
}

class AddTodo extends TodoBlocEvent {
  Todo todo;
  AddTodo({required this.todo});

  @override
  List<Object?> get props => [todo];
}

class UpdateTodo extends TodoBlocEvent {
  Todo todo;
  UpdateTodo({required this.todo});

  @override
  List<Object?> get props => [todo];
}

class DeleteTodo extends TodoBlocEvent {
  Todo todo;
  DeleteTodo({required this.todo});

  @override
  List<Object?> get props => [todo];
}
