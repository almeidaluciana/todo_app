import 'package:flutter/material.dart';
import 'package:todo_app/controllers/task_controller.dart';
import 'package:todo_app/widgets/button.dart';
import 'package:todo_app/widgets/input.dart';

class TaskFormPage extends StatefulWidget {
  final TaskController controller;

  const TaskFormPage({super.key, required this.controller});

  @override
  State<TaskFormPage> createState() => _TaskFormPageState();
}

class _TaskFormPageState extends State<TaskFormPage> {
  // chave do formulário, nós a utilizamos para validar os campos
  final _formKey = GlobalKey<FormState>();
  // vão pegar o texto digitado
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Nova tarefa")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Input(
                label: "Título",
                controller: titleController,
                validator: (v) => v!.isEmpty
                    ? "Digite o título"
                    : null, // Se estiver vazio mostra mensagem para digitar o título
              ),
              const SizedBox(height: 15),
              Input(
                label: "Descrição",
                controller: descriptionController,
                validator: (v) => v!.isEmpty ? "Digite a descrição" : null,
              ),
              const SizedBox(height: 25),
              MyButton(
                text: "Salvar",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    widget.controller.addTask(
                      titleController.text,
                      descriptionController.text,
                    ); // Salva a tarefa
                    Navigator.pop(context); // Fecha a tela
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
