import 'package:flutter/material.dart';
import 'package:cevo/screens/home.dart';
import 'package:cevo/screens/dashboard.dart';
import 'package:cevo/screens/login.dart';
import 'package:cevo/screens/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cevo',
      routes: <String,WidgetBuilder>{
        "/home": (BuildContext context) => HomeScreen(),
        "/dashboard": (BuildContext context) => DashboardScreen(),
        "/login": (BuildContext context) => LoginScreen() 
      },
      home: SplashScreen(),
     );
  }
}