import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weaderapp_bloc/components/city_select.dart';
import 'package:weaderapp_bloc/viewmodels/city_select_list_view_model.dart';
import 'package:weaderapp_bloc/viewmodels/weather_view_model.dart';

class CitySelect extends StatefulWidget {
  @override
  _CitySelectState createState() => _CitySelectState();
}

class _CitySelectState extends State<CitySelect> {

  final _textController=TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Şehir Seç"),
      ),
      body:
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
                  Navigator.pop(context,_textController.text);

                },
              )
            ],

          ),
        ),



    );
  }
}
