
import 'package:flutter/material.dart';
import 'package:google/screens/home_screen/home_screen.dart';
import 'package:google/screens/login_screen/login_screen.dart';


class Navigate {
  static Map<String, Widget Function(BuildContext)> routes =   {
    '/sing-in' : (context) => const HomeScreen(email: '',),
    '/' : (context) => const LoginScreen(),

  };
}
