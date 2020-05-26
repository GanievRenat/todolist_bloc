import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:todolist/models/task/task.dart';
import 'package:todolist/models/task/task_data.dart';

import 'list.dart';
import 'list_data.dart';

enum eventListData { add, remove, check }

class ListBloc {
  ListData _listData = ListData();

  final _listStateController = StreamController<ListData>.broadcast();
  final _listEventController = StreamController<eventListData>();

  StreamSink<ListData> get _inListData => _listStateController.sink;
  Stream<ListData> get listData => _listStateController.stream;
  Sink<eventListData> get listEventSink => _listEventController.sink;

  int get listCount => _listData.listCount;
  ListData get getListData => _listData;

  ListBloc() {
    _listEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(eventListData event) {
    if (event == eventListData.add) {
      //_taskData.addTask()
    }
  }

  void addNewList({String text, int color}) {
    _listData.addList(newListName: text, color: color);
    _inListData.add(_listData);
  }

  void removeList({int index}) {
    _listData.removeList(index: index);
    _inListData.add(_listData);
  }

  void addNewTask({ListTasks list, String text}) {
    _listData.addNewTask(list, Task(name: text, isDone: false));
    _inListData.add(_listData);
  }

  void removeTask({ListTasks list, int index}) {
    list.tasks.removeAt(index);
    _inListData.add(_listData);
  }

  void removeAllTask({ListTasks list}) {
    list.tasks.clear();
    _inListData.add(_listData);
  }

  void checkTask({ListTasks list, int index}) {
    list.tasks[index].isDone = !list.tasks[index].isDone;
    _inListData.add(_listData);
  }

  void dispose() {
    _listStateController.close();
    _listEventController.close();
  }
}
