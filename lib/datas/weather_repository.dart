import 'package:flutter/cupertino.dart';
import 'package:weaderapp_bloc/datas/weather_api_client.dart';
import 'package:weaderapp_bloc/locator.dart';
import 'package:weaderapp_bloc/models/weather.dart';
import 'package:weaderapp_bloc/models/word_of_city.dart';

class WeatherRepository{
  WeatherApiClient weatherApiClient =locator<WeatherApiClient>();

  Future<Weather> getWeather(String city) async {
    final int cityID=await weatherApiClient.getLocation(city);
    final weather=await weatherApiClient.getWeather(cityID);

    return weather;
  }

  Future<Weather> getWeatherFromID(int cityID) async {
    final weather=await weatherApiClient.getWeather(cityID);
    return weather;
  }


  Future<int> getCitys(String city) async {
    final int cityID=await weatherApiClient.getLocation(city);
    return cityID;
  }

  Future<List<WordOfCity>> getCityList(String city) async {
    List<WordOfCity> citys=await weatherApiClient.getLocationList(city);
    return citys;
  }

}