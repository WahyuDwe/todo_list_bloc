part of 'todo_list_bloc.dart';

sealed class TodoListState {}

class TodoListInitial extends TodoListState {}

class TodoListLoaded extends TodoListState {
  final List<Todo> todos;

  TodoListLoaded(this.todos);
}
