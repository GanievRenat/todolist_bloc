import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

class ColorPickerDialog {
  final BuildContext context;
  final Function selectColor;

  ColorSwatch _tempMainColor;
  Color _tempShadeColor;
  ColorSwatch _mainColor = Colors.blue;
  Color _shadeColor = Colors.blue[800];

  ColorPickerDialog({this.context, this.selectColor}) {}

  void _openDialog(String title, Widget content) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(6.0),
          title: Text(title),
          content: content,
          actions: [
            FlatButton(
              child: Text('Отмена'),
              onPressed: Navigator.of(context).pop,
            ),
            FlatButton(
              child: Text('Выбрать'),
              onPressed: () {
                if (selectColor != null) {
                  selectColor(_tempMainColor);
                }
                Navigator.of(context).pop();
                //setState(() {
                //  _mainColor = _tempMainColor;
                //  _shadeColor = _tempShadeColor;
                //  print(_mainColor.value);
                //});
              },
            ),
          ],
        );
      },
    );
  }

  void openColorPicker() async {
    _openDialog(
      "Выберите цвет",
      MaterialColorPicker(
        shrinkWrap: true,
        selectedColor: _shadeColor,
        onColorChange: (color) => _tempShadeColor = color,
        onMainColorChange: (color) => _tempMainColor = color,
        onBack: () => print("Back button pressed"),
      ),
    );
  }
}
