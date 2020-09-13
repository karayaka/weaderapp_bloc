import 'package:get_it/get_it.dart';
import 'package:weaderapp_bloc/datas/weather_repository.dart';
import 'package:weaderapp_bloc/viewmodels/city_select_list_view_model.dart';
import 'package:weaderapp_bloc/viewmodels/weather_view_model.dart';
import 'datas/weather_api_client.dart';

GetIt locator=GetIt.instance;

void setupLocator(){
  locator.registerLazySingleton(() => WeatherRepository());
  locator.registerLazySingleton(() => WeatherApiClient());
  locator.registerFactory(() => WeatherViewModel());
  locator.registerFactory(() => CitySeleletcListViewModel());

}