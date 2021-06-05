import 'package:flutter/material.dart';
import 'package:ui2/values/colors.dart';

class DescriptionItem extends StatelessWidget {
  final String header;
  final String description;

  const DescriptionItem({Key key, this.header, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: TextStyle(
            fontSize: 24,
            color: loginSplashColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          description,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontFamily: 'Nunito',
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
