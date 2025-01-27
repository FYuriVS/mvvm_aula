import 'package:flutter/material.dart';
import 'package:mvvm/ui/todo/viewmodels/todo_viewmodel.dart';

class AddTodoWidget extends StatefulWidget {
  final TodoViewmodel todoViewmodel;
  const AddTodoWidget({super.key, required this.todoViewmodel});

  @override
  State<AddTodoWidget> createState() => _AddTodoWidgetState();
}

class _AddTodoWidgetState extends State<AddTodoWidget> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController nameController = TextEditingController();
  final verticalGap = const SizedBox(
    height: 16,
  );

  @override
  void initState() {
    widget.todoViewmodel.addTodo.addListener(_onResult);
    super.initState();
  }

  void _onResult() {
    if (widget.todoViewmodel.addTodo.running) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: IntrinsicHeight(
              child: Center(child: CircularProgressIndicator()),
            ),
          );
        },
      );
    } else {
      if (widget.todoViewmodel.addTodo.completed) {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.green,
            content: Center(
              child: Text("teste"),
            )));
      }
      if (widget.todoViewmodel.addTodo.error) {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: Center(
              child: Text("Ocorreu um erro ao criar todo"),
            )));
      }
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    widget.todoViewmodel.addTodo.removeListener(_onResult);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: IntrinsicHeight(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Nome",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor preencha o campo de nome";
                  }

                  return null;
                },
              ),
              verticalGap,
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() == true) {
                    widget.todoViewmodel.addTodo.execute(nameController.text);
                  }
                },
                child: const Text("Salvar"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
