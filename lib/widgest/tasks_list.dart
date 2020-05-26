import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/list_tasks/list.dart';
import 'package:todolist/models/list_tasks/list_bloc.dart';
import 'package:todolist/models/task/task.dart';
import 'package:todolist/widgest/empty_task.dart';
import 'package:todolist/widgest/task_title.dart';

class TasksList extends StatelessWidget {
  List<Task> taskData;
  ListTasks listTasks;
  TasksList(this.listTasks, this.taskData);

  @override
  Widget build(BuildContext context) {
    ListBloc bloc = Provider.of<ListBloc>(context, listen: false);

    if (taskData.length == 0) {
      return EmptyTask();
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return TaskTitle(
            listTasks: listTasks,
            name: taskData[index].name,
            isChecked: taskData[index].isDone,
            chackBoxCallback: (value) {
              bloc.checkTask(list: listTasks, index: index);
            },
            longClick: () {
              bloc.removeTask(list: listTasks, index: index);
            },
          );
        },
        itemCount: taskData.length,
      );
    }
  }
}
