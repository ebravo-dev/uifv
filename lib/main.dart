import 'package:flutter/material.dart';
import 'package:ui2/pages/activitiesPage.dart';
import 'package:ui2/pages/selectProductPage.dart';
import 'package:ui2/pages/splashPage.dart';
import 'package:ui2/utils/ux_methods.dart';

void main() {
  changeStatusBarColorWhiteOp80();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FV',
      themeMode: ThemeMode.light,
      theme: ThemeData.light(),
      home: ActivitiesPage(
        eventsFlag: false,
      ),
    );
  }
}
