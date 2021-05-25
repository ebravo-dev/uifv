import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void restoreStatusBarColor() async {
  await Future.delayed(Duration(milliseconds: 300));
  changeStatusBarColorWhiteOp80();
}

Future waitInkWellAnimation() async {
  await Future.delayed(Duration(milliseconds: 300));
}

void changeStatusBarColorWhiteOp80() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color.fromRGBO(255, 255, 255, 0.8),
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
}

void changestatusBarColorTransparent() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
}

Widget loadingDialog({String label, Color color}) {
  return AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(26),
    ),
    contentPadding: EdgeInsets.symmetric(
      vertical: 40,
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 40,
          width: 40,
          child: CircularProgressIndicator(
            strokeWidth: 2.5,
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Text(label),
      ],
    ),
  );
}
