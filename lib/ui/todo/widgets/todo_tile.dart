import 'package:flutter/material.dart';
import 'package:mvvm/domain/models/todo.dart';
import 'package:mvvm/ui/todo/viewmodels/todo_viewmodel.dart';

class TodoTile extends StatefulWidget {
  final TodoViewmodel todoViewmodel;
  final Todo todo;
  const TodoTile({
    super.key,
    required this.todo,
    required this.todoViewmodel,
  });

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  @override
  void initState() {
    widget.todoViewmodel.deleteTodo.addListener(_onResult);
    super.initState();
  }

  void _onResult() {
    if (widget.todoViewmodel.deleteTodo.completed) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Todo removido com sucesso!"),
        ),
      );
    }
    if (widget.todoViewmodel.deleteTodo.error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Ocorreu um erro ao deletar!"),
        ),
      );
    }
  }

  @override
  void dispose() {
    widget.todoViewmodel.deleteTodo.removeListener(_onResult);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text("${widget.todo.id}"),
      title: Text(widget.todo.name),
      trailing: IconButton(
        onPressed: () {
          widget.todoViewmodel.deleteTodo.execute(widget.todo);
        },
        icon: const Icon(Icons.delete),
        color: Colors.red,
      ),
    );
  }
}
