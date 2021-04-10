import 'package:flutter/material.dart';

class CustomLargeButton extends StatelessWidget {
  final Function action;
  final Color backgroundColor, splash;
  final String label;

  const CustomLargeButton(
      {Key key,
      this.action,
      @required this.backgroundColor,
      @required this.splash,
      @required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: action,
            splashColor: splash,
            splashFactory: InkRipple.splashFactory,
            borderRadius: BorderRadius.circular(40),
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 12,
              ),
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
