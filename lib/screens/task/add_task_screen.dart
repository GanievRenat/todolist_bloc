import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/list_tasks/list.dart';
import 'package:todolist/models/list_tasks/list_bloc.dart';

import '../../constants.dart';

class AddTaskScreen extends StatefulWidget {
  ListTasks listTasks;

  AddTaskScreen(this.listTasks);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String new_task_title;
  ListBloc blocList;

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    blocList = Provider.of<ListBloc>(context, listen: false);

    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset('assets/images/newtask.png'),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Новая задача',
              textAlign: TextAlign.left,
              style: MebiumTextStyle.copyWith(
                fontSize: 25.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              textInputAction: TextInputAction.done,
              autofocus: true,
              style: RegularTextStyle,
              onChanged: (value) {
                new_task_title = value;
              },
              onSubmitted: (value) {
                blocList.addNewTask(list: widget.listTasks, text: new_task_title);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
