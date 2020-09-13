
import 'package:flutter/material.dart';
import 'package:weaderapp_bloc/enums/city_state.dart';
import 'package:weaderapp_bloc/models/word_of_city.dart';

class CitySelectWidget extends StatelessWidget {
  List<WordOfCity> citys;
  CityState state;
  CitySelectWidget(this.citys,this.state);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreanBuilder(state,context)
    );
  }

  Widget ListViewBuilder(BuildContext context){
    return ListView.builder(
        itemCount: citys.length,
        itemBuilder: (context,i){
          return listViewItemBuilder(citys[i],context);
        },

    );
  }

  Widget listViewItemBuilder(WordOfCity city, BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(city.title) ,
        onTap:()=>{
          Navigator.pop(context,city.woeid)
        }
      ),

    );
  }
  Widget ScreanBuilder(CityState state, BuildContext context){
    if(state==CityState.weatherErorState){
      return Text("Hata");
    }if(state==CityState.weatherLodingState){
      return Center(child: CircularProgressIndicator(),);
    }if(state==CityState.weatherLoadedState){
      return ListViewBuilder(context);
    }else{
      return Text("Tutmadı");
    }
  }


}


