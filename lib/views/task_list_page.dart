import 'package:flutter/material.dart';
import '../controllers/task_controller.dart';
import 'task_form_page.dart';
import 'task_edit_page.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  // Cria um controller para controlar as tarefas
  final TaskController controller = TaskController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Minhas tarefas"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // abre uma nova tela por cima da atual.
          // o await faz o Flutter esperar o usuário voltar da próxima tela antes de continuar a execução do código.
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => TaskFormPage(controller: controller),
            ),
          );
          setState(
            () {},
          ); // Depois que a tela do formulário é fechada e o usuário volta o setState() é chamado para recarregar a tela atual.
        },
        child: const Icon(Icons.add),
      ),

      body: controller.tasks.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/empty.png", width: 300),
                  SizedBox(height: 36),
                  Text("Você não tem nenhuma tarefa."),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(6),
              child: ListView.builder(
                itemCount: controller.tasks.length,
                itemBuilder: (_, i) {
                  final task = controller.tasks[i];

                  return Card(
                    elevation: 0,
                    margin: const EdgeInsets.all(6),
                    child: ListTile(
                      leading: Checkbox(
                        value: task.isDone,
                        onChanged: (_) {
                          setState(() {
                            controller.toggleTask(i);
                          });
                        },
                      ),

                      title: Text(
                        task.title,
                        style: TextStyle(
                          decoration: task.isDone
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      subtitle: Text(task.description),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Botão de Editar
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => TaskEditPage(
                                    controller: controller,
                                    index: i,
                                  ),
                                ),
                              );
                              setState(() {});
                            },
                          ),
                          // Botão de Remover
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                controller.removeTask(i);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
