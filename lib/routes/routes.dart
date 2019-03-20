import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:ui_flow/screens/homeScreen.dart';

import 'package:ui_flow/screens/login.dart';
import 'package:ui_flow/services/api.dart';

class Routes {
  var routes = <String, WidgetBuilder>{
    "/login": (BuildContext context) => MyLoginIndex(),
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
    Timer(Duration(seconds: 1), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String username = prefs.getString("username");
      String password = prefs.getString("password");
      if (username == null ||
          password == null ||
          username.isEmpty ||
          password.isEmpty)
        Navigator.pushReplacementNamed(context, "/login");
      else {
        User user = (await api.loginUser(username, password))[0];
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (
                context,
              ) =>
                  HomeScreen(
                    user: user,
                  ),
            ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Center(
            child: Container(
                width: 300,
                height: 300,
                color: Colors.transparent,
                child: image),
          ),
        ));
  }
}
