import 'package:flutter/material.dart';
import 'package:flutter_with_bloc_z_to_h/topics/route_management/screens/home_screen.dart';
import 'package:flutter_with_bloc_z_to_h/topics/route_management/screens/second_screen.dart';
import 'package:flutter_with_bloc_z_to_h/topics/route_management/screens/third_screen.dart';

class AppRouter{

  Route onGenerateRoute(RouteSettings routeSettings){
    switch (routeSettings.name){
      case '/' :
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );
        break;
      case '/second' :
        return MaterialPageRoute(
          builder: (_) => SecondScreen(),);
        break;
      case '/third' :
        return MaterialPageRoute(
          builder: (_) => ThirdScreen(),);
        break;
      default:
        throw UnimplementedError();
    }
  }
}