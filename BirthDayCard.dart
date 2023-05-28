import 'package:flutter/material.dart';

void main() {
  runApp(BirthDayCardApp());
}

class BirthDayCardApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Color(0xFFD2BCD5),
          body:
          Container(
            height: 1800,
            child:Image(image: AssetImage('images/a9c6369b-dc86-42df-a3e6-6911a1ee316e.jpg')) ,
          )
      ),
    );

  }
}