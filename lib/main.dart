// lib/main.dart
import 'package:appgeolocalizacao/presentation/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Geolocation app',
      home: HomeScreen(),
    );
  }
}
