import 'package:flutter/material.dart';
import 'package:mvvm/ui/todo/viewmodels/todo_viewmodel.dart';
import 'package:mvvm/ui/todo/widgets/add_todo_widget.dart';
import 'package:mvvm/ui/todo/widgets/todos_list.dart';

class TodoScreen extends StatelessWidget {
  final TodoViewmodel todoViewmodel;
  const TodoScreen({
    super.key,
    required this.todoViewmodel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo Screen"),
      ),
      body: ListenableBuilder(
        listenable: todoViewmodel.load,
        builder: (context, child) {
          if (todoViewmodel.load.running) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (todoViewmodel.load.error) {
            return const Center(
              child: Text("Ocorreu um erro ao carregar as todos"),
            );
          }
          return child!;
        },
        child: ListenableBuilder(
          listenable: todoViewmodel,
          builder: (context, child) {
            return TodosList(
              todos: todoViewmodel.todos,
              todoViewmodel: todoViewmodel,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AddTodoWidget(
                  todoViewmodel: todoViewmodel,
                );
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
