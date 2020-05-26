import 'package:todolist/models/task/task.dart';
import 'dart:collection';

class TaskData {
  List<Task> _tasks = [];

  int get tasksCount {
    return _tasks.length;
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask({String newTaskName, int color}) {
    Task newTask = Task(name: newTaskName, isDone: false);
    _tasks.add(newTask);
  }

  void checkTask({int index}) {
    _tasks[index].toggleDone();
  }

  void removeTask({int index}) {
    _tasks.removeAt(index);
  }

  void removeAll() {
    _tasks.clear();
  }

  void removeChecked() {
    _tasks.removeWhere((item) => item.isDone);
  }
}
