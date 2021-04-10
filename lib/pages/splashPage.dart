import 'package:flutter/material.dart';
import 'package:rive_splash_screen/rive_splash_screen.dart';
import 'package:ui2/pages/loginPage.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SplashScreen.navigate(
        width: 190,
        height: 190,
        name: 'assets/rive/a.riv',
        next: (_) => LoginPage(),
        until: () => Future.delayed(Duration(milliseconds: 3500)),
        startAnimation: 'Animation 1',
      ),
    );
  }
}
