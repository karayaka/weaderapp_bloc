import 'package:flutter/material.dart';
import 'package:weaderapp_bloc/models/weather.dart';

class MaxMinDegre extends StatelessWidget {
   ConsolidatedWeather consolidatedWeather;

  MaxMinDegre(ConsolidatedWeather consolidatedWeather){
    this.consolidatedWeather=consolidatedWeather;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Max: "+consolidatedWeather.maxTemp.floor().toString()+" C",
            style: TextStyle(fontSize: 20),
          ),
          Text("Min: "+consolidatedWeather.minTemp.floor().toString()+" C",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}

