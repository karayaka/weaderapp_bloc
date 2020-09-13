import 'package:flutter/material.dart';
import 'package:weaderapp_bloc/models/word_of_city.dart';
import 'package:weaderapp_bloc/screans/city_select.dart';
import 'package:weaderapp_bloc/screans/city_select_stateles.dart';
import 'package:weaderapp_bloc/screans/weatherapp.dart';

class RouteGenerator{
  static Route<dynamic> routeGenerator(RouteSettings settings){
    debugPrint(settings.name);
  if(settings!=null){
    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_)=>WeatherApp());
      case '/cityselect':
        return MaterialPageRoute(builder: (_)=>CitySelect());
      case '/selectcityles':
        final args=settings.arguments;
        if(args is WordOfCity){
          return MaterialPageRoute(builder: (_)=>CitySelectles(city: args,));
        }else if(args==null) {
          return MaterialPageRoute(builder: (_)=>CitySelectles());
        }
        return _errorRoute();

      default:
        return _errorRoute();
    }
  }

  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        appBar: AppBar(
          title: Text("Hata"),
        ),
        body: Center(
          child: Text("Hata"),
        ),
      );
    });

  }
}