import 'package:flutter/material.dart';
import "pages/home.dart";
import "pages/location_select.dart";
import "pages/loading.dart";
import 'package:file/pages/signup.dart';



void main(){

  runApp(MyApp());
}

class  MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context)=>Loading(),
        '/home':(context)=>Home(),
        '/location':(context)=>Location(),
        '/signup':(context)=>SignUp()
      },
      
      
    );
  } 
}