import '../models/task_model.dart';

class TaskController {
  final List<Task> tasks = [];

  void addTask(String title, String description) {
    tasks.add(Task(title: title, description: description));
  }

  void toggleTask(int index) {
    tasks[index].isDone = !tasks[index].isDone;
  }

  void removeTask(int index) {
    tasks.removeAt(index);
  }

  void editTask(int index, String newTitle, String newDescription) {
    tasks[index].title = newTitle;
    tasks[index].description = newDescription;
  }
}
