import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  String id;
  String task;
  String description;
  bool? isCompleted;
  bool? isCancellled;

  Todo(
      {required this.id,
      required this.task,
      required this.description,
      this.isCancellled,
      this.isCompleted});

  Todo copyWith(String? id, String? task, String? description,
      bool? isCompleted, bool? isCancellled) {
    return Todo(
        id: id ?? this.id,
        task: task ?? this.task,
        description: description ?? this.description,
        isCancellled: isCancellled ?? this.isCancellled,
        isCompleted: isCompleted ?? this.isCompleted);
  }

  @override
  List<Object?> get props => [id, task, description];

  static List<Todo> todo = [
    Todo(id: '1', task: 'TaskOne', description: 'Complete quick'),
    Todo(id: '2', task: 'TaskTwo', description: 'Complete quick'),
  ];
}
