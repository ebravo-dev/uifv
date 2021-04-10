import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui2/values/colors.dart';

class NetWorkLogin extends StatelessWidget {
  final Function ffacebook, ftwitter, fgoogle;

  NetWorkLogin({
    Key key,
    @required this.ffacebook,
    @required this.ftwitter,
    @required this.fgoogle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton(
          heroTag: null,
          onPressed: ffacebook,
          elevation: 0,
          backgroundColor: facebookColor,
          child: Icon(
            EvaIcons.facebook,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        FloatingActionButton(
          heroTag: null,
          onPressed: ftwitter,
          elevation: 0,
          backgroundColor: twitterColor,
          child: Icon(
            EvaIcons.twitter,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        FloatingActionButton(
          heroTag: null,
          onPressed: fgoogle,
          elevation: 0,
          backgroundColor: googleColor,
          child: Icon(
            EvaIcons.google,
          ),
        ),
      ],
    );
  }
}
