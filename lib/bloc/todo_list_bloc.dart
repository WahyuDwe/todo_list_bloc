import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_bloc/model/todo_model.dart';

part 'todo_list_event.dart';
part 'todo_list_state.dart';

class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  TodoListBloc() : super(TodoListInitial()) {
    on<AddTodo>((event, emit) {
      final todo = Todo(
        name: event.title,
        createdAt: DateTime.now(),
      );

      if (state is TodoListLoaded) {
        final List<Todo> updatedTodos =
            List.from((state as TodoListLoaded).todos)..add(todo);
        emit(TodoListLoaded(updatedTodos));
      } else {
        emit(TodoListLoaded([todo]));
      }
    });
  }
}
