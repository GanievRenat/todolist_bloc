import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmptyTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Image.asset('assets/images/emptytask.png')
          /*child: SvgPicture.asset(
          'assets/image2.svg',
          width: 300.0,
        ),*/
          ),
    );
  }
}
