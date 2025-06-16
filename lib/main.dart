import 'package:flutter/material.dart';
import './ui/calculascreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de Bitola',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculaScreen(),  
    );
  }
}