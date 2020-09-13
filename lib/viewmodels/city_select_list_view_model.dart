import 'package:flutter/material.dart';
import 'package:weaderapp_bloc/datas/weather_repository.dart';
import 'package:weaderapp_bloc/enums/city_state.dart';
import 'package:weaderapp_bloc/locator.dart';
import 'package:weaderapp_bloc/models/word_of_city.dart';

class CitySeleletcListViewModel with ChangeNotifier {
  CityState _state;

  CityState get state => _state;

  set state(CityState value) {
    _state = value;
    notifyListeners();
    debugPrint("setStae");
  }

  var _repository=locator<WeatherRepository>();

  List<WordOfCity> _wordOfCitys;
  CitySeleletcListViewModel(){
    _wordOfCitys=List<WordOfCity>();
  }

  List<WordOfCity> get wordOfCitys => _wordOfCitys;

  set wordOfCitys(List<WordOfCity> value) {
    _wordOfCitys = value;
  }

  Future<List<WordOfCity>>getCitySelectList(String city) async{
    try{
      state=CityState.weatherLodingState;
      _wordOfCitys= await _repository.getCityList(city);
      state=CityState.weatherLoadedState;
    }catch(e){
      state=CityState.weatherErorState;
    }
    switch(state) {
      case CityState.initalWeatherState:
      debugPrint("hata");
        break;
      case CityState.weatherLodingState:
        debugPrint("Yükleniyoır");
        break;
      case CityState.weatherLoadedState:
        debugPrint("Yükleniyoır");
        break;
      case CityState.weatherErorState:
        debugPrint("Api HAta");
        break;
        return _wordOfCitys;
    }
  }



}