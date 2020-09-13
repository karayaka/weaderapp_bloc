import 'package:flutter/material.dart';
import 'package:weaderapp_bloc/models/my_theme.dart';

class MyThemeViewModel with ChangeNotifier{
  MyTheme _myTheme;
  MyThemeViewModel(){

    _myTheme=MyTheme(Colors.blue,ThemeData.dark());
  }


}