import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/screens/list_tasks/list_screen.dart';

import 'constants.dart';
import 'models/list_tasks/list_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ListBloc blocList = ListBloc();

  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (context) => blocList,
        dispose: (context, value) => value.dispose(),
        child: MaterialApp(
          title: 'My To-Do List',
          theme: ThemeData(
            primarySwatch: primaryColor,
            accentColor: accentColor,
          ),
          home: ListScreen(),
        ));
  }

  @override
  void dispose() {
    blocList.dispose();
    super.dispose();
  }
}
