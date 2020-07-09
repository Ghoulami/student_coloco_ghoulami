import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_coloco_ghoulami/Screens/Home/home_screen.dart';
import 'package:student_coloco_ghoulami/Screens/Welcome/welcome_screen.dart';
import 'package:student_coloco_ghoulami/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    // return either the Home or Authenticate widget
    if (user == null){
      return WelcomeScreen();
    } else {
      return HomeScreen();
    }
  }
}
