import 'package:flutter/material.dart';

class AddTodoWidget extends StatefulWidget {
  const AddTodoWidget({
    super.key,
  });

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
  void dispose() {
    nameController.dispose();
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
              ),
              verticalGap,
              ElevatedButton(
                onPressed: () {},
                child: const Text("Salvar"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
