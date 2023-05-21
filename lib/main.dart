import 'package:biometric/home.dart';
import 'package:flutter/material.dart';
import 'package:biometric/auth.dart';
void main()=>runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Biometric',
      home: Auth(),
     routes: {
        '/home': (context) => Home(),
      },
      );
  }
}