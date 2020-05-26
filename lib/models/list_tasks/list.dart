import 'package:todolist/models/task/task.dart';

class ListTasks {
  String name;
  bool isDone;
  int color;
  List<Task> _tasks = [];

  ListTasks({this.name, this.color});

  void addTask(Task task) {
    _tasks.add(task);
  }

  List<Task> get tasks => _tasks;

  @override
  bool operator ==(Object object) {
    if (object == null) return false;
    if (object is ListTasks) {
      return name == object.name;
    }
    return false;
  }
}
