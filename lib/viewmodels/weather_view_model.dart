import 'package:flutter/material.dart';
import 'package:weaderapp_bloc/datas/weather_repository.dart';
import 'package:weaderapp_bloc/enums/city_state.dart';
import 'package:weaderapp_bloc/enums/weather_state.dart';
import 'package:weaderapp_bloc/locator.dart';
import 'package:weaderapp_bloc/models/weather.dart';
import 'package:weaderapp_bloc/models/word_of_city.dart';



class WeatherViewModel with ChangeNotifier {
  WeatherState _state;
  WeatherRepository _repository=locator<WeatherRepository>();
  Weather _getedWeadher;

  WeatherViewModel(){
    _getedWeadher=Weather();
    _state=WeatherState.initalWeatherState;
  }
  WeatherState get state => _state;
  Weather get getedWeadher => _getedWeadher;

  set state(WeatherState value) {
    _state = value;
    notifyListeners();
  }
  Future<Weather>getWeather(String city) async{
    try{
      state=WeatherState.weatherLodingState;
      _getedWeadher= await _repository.getWeather(city);
      state=WeatherState.weatherLoadedState;

    }catch(e){
      state=WeatherState.weatherErorState;
    }
    return _getedWeadher;
  }
  Future<Weather>getWeatherFromID(int cityID) async{
    try{
      state=WeatherState.weatherLodingState;
      _getedWeadher= await _repository.getWeatherFromID(cityID);
      state=WeatherState.weatherLoadedState;
    }catch(e){
      state=WeatherState.weatherErorState;
    }
    return _getedWeadher;
  }



}