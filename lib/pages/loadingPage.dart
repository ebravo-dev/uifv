import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SizedBox(
          // width: 60,
          // height: 60,
          child: CupertinoActivityIndicator(
            // strokeWidth: 2,
            radius: 25,
          ),
        ),
      ),
    );
  }
}
