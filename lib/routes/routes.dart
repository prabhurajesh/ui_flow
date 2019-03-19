import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ui_flow/screens/home.dart';
import 'package:ui_flow/screens/login.dart';

class Routes {
  var routes = <String, WidgetBuilder>{
    "/home": (BuildContext context) => HomeScreen(),
    "/login": (BuildContext context) => MyLoginPage(),
    //"/addingNewProduct": (BuildContext context) => AddingNewProduct()
  };
  ThemeData appTheme = ThemeData(
      primaryColor: Color.fromRGBO(68, 67, 187, 1),
      accentColor: Color.fromRGBO(255, 0, 123, 1),
      textTheme: TextTheme(
          button: TextStyle(
        color: Colors.white,
        // fontWeight: FontWeight.w600,
      )));

  Routes() {
    runApp(
        new MaterialApp(home: SplashScreen(), theme: appTheme, routes: routes));
  }
}

var assetImage = AssetImage('assets/images/logo.jpg');
var image = Image(image: assetImage, fit: BoxFit.cover);

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () => Navigator.pushNamed(context, "/login"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Center(
        child: Container(
            width: 300,
            height: 300,
            //decoration: BoxDecoration(border: Border.all(width: 1)),
            child: image),
      ),
    ));
  }
}
