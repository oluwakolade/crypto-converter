import 'package:flutter/material.dart';
import 'price.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.blue[900],
        scaffoldBackgroundColor: Colors.black
      ),
      home: PriceScreen(),
    );
  }
}

