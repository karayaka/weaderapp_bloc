import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:weaderapp_bloc/models/weather.dart';
import 'package:weaderapp_bloc/models/word_of_city.dart';

class WeatherApiClient{

  static const baseUrl="https://www.metaweather.com/";
  final http.Client httpclient=http.Client();

  Future<int> getLocation(String cityName) async {
    final String ctiyUrl=baseUrl+"api/location/search/?query="+cityName;
    final retVal= await httpclient.get(ctiyUrl);
    if(retVal.statusCode!=200){
      throw Exception("Hatalı Kod");
    }
    final retValJson= (json.decode(retVal.body)) as List;//bu değer liste döndürüyor bu listeden şehir seçtirilebilir!!
    return retValJson[0]["woeid"];
  }

  Future<List<WordOfCity>> getLocationList(String cityName) async {
    final String ctiyUrl=baseUrl+"api/location/search/?query="+cityName;
    final retVal= await httpclient.get(ctiyUrl);
    if(retVal.statusCode!=200){
      throw Exception("Hatalı Kod");
    }
    List<WordOfCity> citys=(json.decode(retVal.body) as List).map((i) =>
        WordOfCity.fromJson(i)).toList();        //bu değer liste döndürüyor bu listeden şehir seçtirilebilir!!
    return citys;
  }

  Future<Weather> getWeather(int cityID) async {
    final weatherUrl= baseUrl+ "api/location/$cityID";
    final retVal=await httpclient.get(weatherUrl);
    if(retVal.statusCode!=200){
      throw Exception("Hatalı Hava durumu");
    }
    final retValJson= json.decode(retVal.body);
    var weatherObject=Weather.fromJson(retValJson);
    return weatherObject;

  }


}