import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todolist/constants.dart';

class ListTitle extends StatelessWidget {
  final int defaultColor = 4288585374;
  final int color;
  final String name;
  final String count;
  final Function click;

  ListTitle({this.name, this.count, this.color, this.click});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: click,
      title: Row(
        children: <Widget>[
          ClipOval(
            child: Container(
              height: 20.0,
              width: 20.0,
              color: ColorSwatch((color != 0) ? color : defaultColor, null),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Text(
              name,
              style: MebiumTextStyle,
            ),
          )
        ],
      ),
      trailing: Text(
        count,
        style: MebiumTextStyle.copyWith(
          color: Colors.black45,
        ),
      ),
    );
  }
}
