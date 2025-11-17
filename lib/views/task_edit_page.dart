import 'package:flutter/material.dart';
import 'package:todo_app/widgets/button.dart';
import 'package:todo_app/widgets/input.dart';
import '../controllers/task_controller.dart';

class TaskEditPage extends StatefulWidget {
  final TaskController controller;
  final int index; //indica qual tarefa será editada

  const TaskEditPage({
    super.key,
    required this.controller,
    required this.index,
  });

  @override
  State<TaskEditPage> createState() => _TaskEditPageState();
}

class _TaskEditPageState extends State<TaskEditPage> {
  final _formKey = GlobalKey<FormState>();

  late String title;
  late String desc;

  @override
  void initState() {
    // é chamado antes de construir a interface
    super.initState();
    final task = widget.controller.tasks[widget.index];
    title = task.title;
    desc = task.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Editar tarefa")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Input(
                label: "Título",
                initialValue: title,
                validator: (v) => v!.isEmpty
                    ? "Informe um título"
                    : null, // null é igual a tudo certo!
                onSaved: (v) => title = v!,
              ),
              const SizedBox(height: 16),
              Input(
                label: "Descrição",
                initialValue: desc,
                validator: (v) => v!.isEmpty ? "Informe uma descrição" : null,
                onSaved: (v) => desc = v!,
              ),
              SizedBox(height: 16),
              MyButton(
                text: "Salvar alterações",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // salva os dados digitados nos inputs dentro das variaveis
                    _formKey.currentState!.save();
                    widget.controller.editTask(widget.index, title, desc);
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
