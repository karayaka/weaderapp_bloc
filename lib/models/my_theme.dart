import 'package:flutter/material.dart';

class MyTheme{
    MaterialColor _color;
    ThemeData _theme;

    MyTheme(this._color, this._theme);

  MaterialColor get color => _color;

  set color(MaterialColor value) {
    _color = value;
  }

    ThemeData get theme => _theme;

  set theme(ThemeData value) {
    _theme = value;
  }
}