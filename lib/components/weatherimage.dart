import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weaderapp_bloc/viewmodels/weather_view_model.dart';

class WeatherImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _weatherViewModel = Provider.of<WeatherViewModel>(context);
    var imgKey=_weatherViewModel.getedWeadher.consolidatedWeather[0].weatherStateAbbr;
    return Column(
      children: [
        Text(
          _weatherViewModel.getedWeadher.consolidatedWeather[0].theTemp.floor()
              .toString()+" C",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Image.network(
            "https://www.metaweather.com/static/img/weather/png/$imgKey.png",
          width: 200,
        )

      ],
    );
  }
}

