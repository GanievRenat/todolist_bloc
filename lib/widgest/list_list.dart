import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/list_tasks/list.dart';
import 'package:todolist/models/list_tasks/list_data.dart';
import 'package:todolist/models/list_tasks/list_bloc.dart';
import 'package:todolist/widgest/empty_list.dart';
import 'package:todolist/widgest/list_title.dart';
import 'package:todolist/screens/task/tasks_screen.dart';

class ListList extends StatelessWidget {
  ListData listData;
  ListList(this.listData);

  @override
  Widget build(BuildContext context) {
    //ListBloc blocList = Provider.of<ListBloc>(context, listen: false);

    if (listData.listCount == 0) {
      return EmptyList();
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return ListTitle(
            name: listData.list[index].name,
            count: listData.getCountTasks(listData.list[index]).toString(),
            color: listData.list[index].color,
            click: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TasksScreen(listData.getListTasks(index)),
                  ));
            },
          );
        },
        itemCount: listData.listCount,
      );
    }
  }
}
