import 'package:flutter/material.dart';

const TitleTextStyle = TextStyle(
  fontFamily: 'GoogleFontBold',
  fontSize: 40.0,
  color: Colors.white,
);

const RegularTextStyle = TextStyle(
  fontFamily: 'GoogleFontRegular',
  fontSize: 16.0,
);

const MebiumTextStyle = TextStyle(
  fontFamily: 'GoogleFontMebium',
  fontSize: 16.0,
);

const Map<int, Color> color = {
  50: Color.fromRGBO(147, 205, 72, .1),
  100: Color.fromRGBO(147, 205, 72, .2),
  200: Color.fromRGBO(147, 205, 72, .3),
  300: Color.fromRGBO(147, 205, 72, .4),
  400: Color.fromRGBO(147, 205, 72, .5),
  500: Color.fromRGBO(147, 205, 72, .6),
  600: Color.fromRGBO(147, 205, 72, .7),
  700: Color.fromRGBO(147, 205, 72, .8),
  800: Color.fromRGBO(147, 205, 72, .9),
  900: Color.fromRGBO(147, 205, 72, 1),
};

const MaterialColor primaryColor = MaterialColor(0xFFEB7E44, color);
const MaterialColor accentColor = MaterialColor(0xFF8CAB5A, color);
