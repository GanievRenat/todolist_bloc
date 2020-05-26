import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/list_tasks/list.dart';
import 'package:todolist/models/list_tasks/list_bloc.dart';
import 'package:todolist/models/list_tasks/list_data.dart';
import 'package:todolist/widgest/tasks_list.dart';
import 'package:todolist/screens/task/add_task_screen.dart';
import 'package:todolist/models/task/task_data.dart';

import '../../constants.dart';

class MenuItem {
  const MenuItem({this.title, this.icon});

  final String title;
  final IconData icon;
}

class TasksScreen extends StatefulWidget {
  ListTasks listTasks;

  static const List<MenuItem> menuItems = const <MenuItem>[
    const MenuItem(title: 'Удалить отмеченные', icon: Icons.delete_outline),
    const MenuItem(title: 'Очистить список', icon: Icons.clear_all),
  ];

  TasksScreen(this.listTasks);

  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  ListBloc blocTask;

  @override
  Widget build(BuildContext context) {
    blocTask = Provider.of<ListBloc>(context, listen: false);

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: ((widget.listTasks != null) && (widget.listTasks.color != 0))
              ? ColorSwatch(widget.listTasks.color, null)
              : Theme.of(context).accentColor,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => SingleChildScrollView(
                  child: Container(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen(widget.listTasks),
              )),
            );
            //showBottomSheet(context: context, builder: buildBottomSheet);
          },
        ),
        backgroundColor: ((widget.listTasks != null) && (widget.listTasks.color != 0))
            ? ColorSwatch(widget.listTasks.color, null)
            : Theme.of(context).accentColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          widget.listTasks.name,
                          style: TitleTextStyle,
                        ),
                      ),
                    ],
                  ),
                  StreamBuilder<ListData>(
                      stream: blocTask.listData,
                      initialData: blocTask.getListData,
                      builder: (context, snapshot) {
                        return Text(
                          'Закрыто ${snapshot.data.getCheckCountTasks(widget.listTasks)} из ${snapshot.data.getCountTasks(widget.listTasks)}',
                          style: RegularTextStyle.copyWith(color: Colors.white),
                        );
                      }),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: StreamBuilder<ListData>(
                    stream: blocTask.listData,
                    initialData: blocTask.getListData,
                    builder: (context, snapshot) {
                      return TasksList(widget.listTasks, snapshot.data.getTasks(widget.listTasks));
                    }),
              ),
            ),
          ],
        ));
  }
}
