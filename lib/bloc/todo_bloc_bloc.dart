import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_bloc/models/todo_model.dart';
part 'todo_bloc_event.dart';
part 'todo_bloc_state.dart';

class TodoBlocBloc extends Bloc<TodoBlocEvent, TodoBlocState> {
  TodoBlocBloc() : super(TodoBlocInitial()) {
    on<LoadTodo>(_onLoadTodo);
    on<AddTodo>(_onAddTodo);
    on<UpdateTodo>(_onUpdateTodo);
    on<DeleteTodo>(_onDeleteTodo);
  }

  void _onLoadTodo(LoadTodo event, Emitter<TodoBlocState> emit) {
    emit(TodoLoaded(todos: event.todos));
  }

  void _onAddTodo(AddTodo event, Emitter<TodoBlocState> emit) {
    final state = this.state;
    if (state is TodoLoaded) {
      print(state.todos);
      emit(TodoLoaded(todos: List.from(state.todos)..add(event.todo)));
    }
  }

  void _onUpdateTodo(UpdateTodo event, Emitter<TodoBlocState> emit) {
    final state = this.state;
    if (state is TodoLoaded) {
      List<Todo> todos = state.todos
          .map((e) => e.id == event.todo.id ? event.todo : e)
          .toList();
      emit(TodoLoaded(todos: todos));
    }
  }

  void _onDeleteTodo(DeleteTodo event, Emitter<TodoBlocState> emit) {
    final state = this.state;
    if (state is TodoLoaded) {
      List<Todo> todos =
          state.todos.where((element) => element.id != event.todo.id).toList();
      emit(TodoLoaded(todos: todos));
    }
  }
}
