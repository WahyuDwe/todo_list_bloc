part of 'todo_list_bloc.dart';

sealed class TodoListEvent {}

class AddTodo extends TodoListEvent {
  final String title;

  AddTodo(this.title);
}
