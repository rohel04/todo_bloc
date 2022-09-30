part of 'todo_bloc_bloc.dart';

abstract class TodoBlocState extends Equatable {}

class TodoBlocInitial extends TodoBlocState {
  @override
  List<Object?> get props => [];
}

class TodoLoaded extends TodoBlocState {
  List<Todo> todos;

  TodoLoaded({this.todos = const <Todo>[]});

  @override
  List<Object?> get props => [todos];
}
