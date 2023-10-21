import 'package:first_calculator/screen_calculator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    routes: {
     CalculatoRscreen.routeName:(_)=>CalculatoRscreen(),
  },
    initialRoute:CalculatoRscreen.routeName ,
  ));
}