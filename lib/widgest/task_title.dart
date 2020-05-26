import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todolist/constants.dart';
import 'package:todolist/models/list_tasks/list.dart';

class TaskTitle extends StatelessWidget {
  final bool isChecked;
  final String name;
  final Function chackBoxCallback;
  final Function longClick;
  final ListTasks listTasks;

  TaskTitle({this.listTasks, this.name, this.isChecked, this.chackBoxCallback, this.longClick});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longClick,
      title: Row(
        children: <Widget>[
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Text(
              name,
              style: RegularTextStyle.copyWith(
                  decoration: isChecked ? TextDecoration.lineThrough : TextDecoration.none,
                  color: isChecked ? Colors.grey : Colors.black),
            ),
          )
        ],
      ),
      trailing: Checkbox(
        activeColor: (listTasks.color != 0) ? ColorSwatch(listTasks.color, null) : Theme.of(context).accentColor,
        value: isChecked,
        onChanged: chackBoxCallback,
      ),
    );
  }
}
