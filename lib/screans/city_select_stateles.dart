import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weaderapp_bloc/components/city_select.dart';
import 'package:weaderapp_bloc/enums/city_state.dart';
import 'package:weaderapp_bloc/models/word_of_city.dart';
import 'package:weaderapp_bloc/viewmodels/city_select_list_view_model.dart';

class CitySelectles extends StatelessWidget {
  CitySeleletcListViewModel _citySelectListViewModel;
  final _textController=TextEditingController();
  WordOfCity city;

  CitySelectles({this.city});

  @override
  Widget build(BuildContext context) {
    //debugPrint(city.toString());
    _citySelectListViewModel=Provider.of<CitySeleletcListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Şehir Seç"),
      ),
      body: Column(
        children: [
          Form(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: _textController,

                      decoration: InputDecoration(
                        labelText: "Şehir",
                        hintText: "Şehir Arayın",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: (){
                    //Navigator.pop(context,_textController.text);
                     _citySelectListViewModel.getCitySelectList(_textController.text);
                  },
                )
              ],

            ),
          ),
          Expanded(
              child: CitySelectWidget(_citySelectListViewModel.wordOfCitys,_citySelectListViewModel.state)
          ),

        ],
      ),
    );
  }


}
