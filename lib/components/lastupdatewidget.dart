import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weaderapp_bloc/viewmodels/weather_view_model.dart';


class LastUpdateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _weatherViewModel=Provider.of<WeatherViewModel>(context);

    var newDate=_weatherViewModel.getedWeadher.time;
    debugPrint(_weatherViewModel.getedWeadher.time.toString());

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "Son Güncelleme "+TimeOfDay.fromDateTime(newDate).format(context),
          style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),
        ),
      ),
    );
  }
}
