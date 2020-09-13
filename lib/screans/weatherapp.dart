import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weaderapp_bloc/components/lastupdatewidget.dart';
import 'package:weaderapp_bloc/components/locationWidget.dart';
import 'package:weaderapp_bloc/components/maxmindegree.dart';
import 'package:weaderapp_bloc/components/weatherimage.dart';
import 'package:weaderapp_bloc/enums/weather_state.dart';
import 'package:weaderapp_bloc/viewmodels/city_select_list_view_model.dart';
import 'package:weaderapp_bloc/viewmodels/weather_view_model.dart';
import 'city_select.dart';
import 'city_select_stateles.dart';

class WeatherApp extends StatelessWidget {
  int selectedCity=0;
  WeatherViewModel _weatherViewModel;
  @override
  Widget build(BuildContext context) {
    _weatherViewModel=Provider.of<WeatherViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              //selectedCity= await Navigator.push(context,
               //MaterialPageRoute(builder: (context)=>CitySelect()));
              selectedCity= await Navigator.pushNamed<dynamic>(context,'/selectcityles',);

              //Navigator.push(context,MaterialPageRoute(builder: (context){
                //Provider<CitySeleletcListViewModel>.value(
                  //value: cityProvider,
                  //child: CitySelectles(),
                //);
              //}));
              //debugPrint(selectedCity);
              _weatherViewModel.getWeatherFromID(selectedCity);
            },
          )
        ],
      ),
      body: Center(
        child: (_weatherViewModel.state==WeatherState.weatherLoadedState)?weatherAppGeted(_weatherViewModel):
        (_weatherViewModel.state==WeatherState.weatherLodingState)?weatherOnload():
        (_weatherViewModel.state==WeatherState.weatherLodingState)?weatherEror():Text("Şehir Seçin"),

      ),
    );
  }

  ListView weatherAppGeted(WeatherViewModel weatherViewModel) {
    return ListView(
        children: [
          LocationWidget(selectedCity: weatherViewModel.getedWeadher.title,),
          WeatherImage(),
          LastUpdateWidget(),
          MaxMinDegre(weatherViewModel.getedWeadher.consolidatedWeather[0])
        ],
      );
  }

  weatherOnload() {
    return CircularProgressIndicator();
  }

  weatherEror() {
    return Text("Gelirken Hata");
  }
}
