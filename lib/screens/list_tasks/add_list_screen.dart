import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/list_tasks/list_bloc.dart';
import 'package:todolist/widgest/color_picker_dialog.dart';
import 'package:todolist/constants.dart';

class AddListScreen extends StatefulWidget {
  @override
  _AddListScreenState createState() => _AddListScreenState();
}

class _AddListScreenState extends State<AddListScreen> {
  String new_task_title;
  ListBloc blocList;
  ColorSwatch _mainColor;

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
            Image.asset('assets/images/newlist.png'),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Создать новый лист',
              textAlign: TextAlign.left,
              style: MebiumTextStyle.copyWith(
                fontSize: 25.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: <Widget>[
                Flexible(
                  child: TextField(
                    textAlign: TextAlign.center,
                    textInputAction: TextInputAction.done,
                    autofocus: true,
                    style: RegularTextStyle,
                    onChanged: (value) {
                      new_task_title = value;
                    },
                    onSubmitted: (value) {
                      blocList.addNewList(text: new_task_title, color: (_mainColor != null) ? _mainColor.value : 0);
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                ClipOval(
                  child: Material(
                    color: _mainColor, // button color
                    child: InkWell(
                      splashColor: _mainColor, // inkwell color
                      child: SizedBox(
                          width: 35,
                          height: 35,
                          child: Icon(
                            Icons.colorize,
                            size: 20,
                          )),
                      onTap: () async {
                        ColorPickerDialog(
                            context: context,
                            selectColor: (color) {
                              setState(() {
                                _mainColor = color;
                              });
                            }).openColorPicker();
                      },
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
