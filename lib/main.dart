import 'package:flutter/material.dart';
import 'login.dart';

void main(){
  runApp(App());
}

class App extends StatefulWidget{
  @override
  AppState createState() => AppState();
}

class AppState extends State<App>{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.pinkAccent,
        focusColor: Colors.pinkAccent,
        accentColor: Colors.pinkAccent
      ),
      home: LoginScreen()
    );
  }
}