import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/list_tasks/list_bloc.dart';
import 'package:todolist/models/list_tasks/list_data.dart';
import 'package:todolist/widgest/list_list.dart';
import 'package:todolist/screens/list_tasks/add_list_screen.dart';

import '../../constants.dart';

class MenuItem {
  const MenuItem({this.title, this.icon});

  final String title;
  final IconData icon;
}

class ListScreen extends StatefulWidget {
  static const List<MenuItem> menuItems = const <MenuItem>[
    const MenuItem(title: 'Удалить отмеченные', icon: Icons.delete_outline),
    const MenuItem(title: 'Очистить список', icon: Icons.clear_all),
  ];

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  ListBloc blocList;

  @override
  Widget build(BuildContext context) {
    blocList = Provider.of<ListBloc>(context, listen: false);

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).accentColor,
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
                child: AddListScreen(),
              )),
            );
            //showBottomSheet(context: context, builder: buildBottomSheet);
          },
        ),
        backgroundColor: Theme.of(context).primaryColor,
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
                          'Мои задачи',
                          style: TitleTextStyle,
                        ),
                      ),
                    ],
                  ),
                  StreamBuilder<ListData>(
                      stream: blocList.listData,
                      initialData: blocList.getListData,
                      builder: (context, snapshot) {
                        return Text(
                          'Список: ${snapshot.data.listCount} шт.',
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
                    stream: blocList.listData,
                    initialData: blocList.getListData,
                    builder: (context, snapshot) {
                      return ListList(snapshot.data);
                    }),
              ),
            ),
          ],
        ));
  }
}
