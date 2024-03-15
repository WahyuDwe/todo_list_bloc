import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_bloc/bloc/todo_list_bloc.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    final todoBloc = BlocProvider.of<TodoListBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: BlocBuilder<TodoListBloc, TodoListState>(
        builder: (BuildContext context, TodoListState state) {
          if (state is TodoListLoaded) {
            return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (BuildContext context, int index) {
                final todo = state.todos[index];
                return ListTile(
                  title: Text(todo.name),
                  subtitle: Text(todo.createdAt.toString()),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red[300],
                    ),
                    onPressed: () => todoBloc.add(RemoveTodo(todo)),
                  ),
                );
              },
            );
          }
          return const Center(
            child: Text('No todos yet!'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add-todo');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
