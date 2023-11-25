import 'package:flutter/material.dart';
import 'package:v_chat/features/homepage/presentation/screens/homepage.dart';
import 'package:v_chat/features/login/presentation/screens/login_screen.dart';

class ScreenRoute {
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => const Homepage());
      case Homepage.routeAddress:
        return MaterialPageRoute(builder: (context) => const Homepage());
      case LoginScreen.routeAddress:
        return MaterialPageRoute(builder: (context) => const LoginScreen());

      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  body: Center(child: Text("404 Not Found")),
                ));
    }
  }
}
