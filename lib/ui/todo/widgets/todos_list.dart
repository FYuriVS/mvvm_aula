import 'package:flutter/material.dart';
import 'package:mvvm/domain/models/todo.dart';
import 'package:mvvm/ui/todo/viewmodels/todo_viewmodel.dart';
import 'package:mvvm/ui/todo/widgets/todo_tile.dart';

class TodosList extends StatelessWidget {
  final List<Todo> todos;
  final TodoViewmodel todoViewmodel;
  const TodosList({
    super.key,
    required this.todos,
    required this.todoViewmodel,
  });

  @override
  Widget build(BuildContext context) {
    if (todos.isEmpty) {
      return const Center(child: Text("Nenhuma tarefa"));
    }
    return ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return TodoTile(
            todo: todos[index],
            todoViewmodel: todoViewmodel,
          );
        });
  }
}
