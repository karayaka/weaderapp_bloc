import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {

  final String selectedCity;

  LocationWidget({@required this.selectedCity});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          selectedCity,
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
        ),
      ),
    );
  }
}
