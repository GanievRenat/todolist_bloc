import 'package:todolist/models/list_tasks/list.dart';
import 'dart:collection';

import 'package:todolist/models/task/task.dart';

class ListData {
  List<ListTasks> _list = [];

  int get listCount {
    return _list.length;
  }

  UnmodifiableListView<ListTasks> get list {
    return UnmodifiableListView(_list);
  }

  ListTasks getListTasks(int index) {
    return _list[index];
  }

  void addList({String newListName, int color}) {
    ListTasks newTask = ListTasks(name: newListName, color: color);
    _list.add(newTask);
  }

  List<Task> getTasks(ListTasks listTasks) {
    if (_list.contains(listTasks)) {
      return _list[_list.indexOf(listTasks)].tasks;
    }
    List<Task> task = [];
    return task;
  }

  int getCountTasks(ListTasks listTasks) {
    return getTasks(listTasks).length;
  }

  int getCheckCountTasks(ListTasks listTasks) {
    return getTasks(listTasks).where((i) => i.isDone).toList().length;
  }

  void addNewTask(ListTasks listTasks, Task newTask) {
    if (_list.contains(listTasks)) {
      _list[_list.indexOf(listTasks)].tasks.add(newTask);
    }
  }

  void removeList({int index}) {
    _list.removeAt(index);
  }

  void removeAll() {
    _list.clear();
  }
}
