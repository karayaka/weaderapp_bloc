import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weaderapp_bloc/locator.dart';
import 'package:weaderapp_bloc/route_generator.dart';
import 'package:weaderapp_bloc/screans/city_select_stateles.dart';
import 'package:weaderapp_bloc/screans/weatherapp.dart';
import 'package:weaderapp_bloc/viewmodels/city_select_list_view_model.dart';
import 'package:weaderapp_bloc/viewmodels/weather_view_model.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WeatherViewModel>(
          create: (context)=>locator<WeatherViewModel>(),
        ),
        ChangeNotifierProvider<CitySeleletcListViewModel>(
          create: (context)=>locator<CitySeleletcListViewModel>(),
        )
      ],
      child: MaterialApp(
        title: 'Weathers',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        //initialRoute: '/Home',
        onGenerateRoute:RouteGenerator.routeGenerator,
      ),
    );
  }
}

