import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

// ignore: camel_case_types
class DivineCard extends StatelessWidget {
  DivineCard(
      {@required this.height,
      @required this.color,
      this.blurRadius,
      this.buttonColor,
      this.buttonText,
      this.subtitle,
      this.title,
      this.iconColor,
      this.fontColor,
      this.fontSize,
      this.icon,
      this.imgHeight,
      this.imgWidth,
      this.buttonBackground,
      this.shadowColor,
      @required this.img});
  final double height;
  final Color color;
  final Color shadowColor;
  final String title;
  final String subtitle;
  final double imgHeight;
  final double imgWidth;
  final double fontSize;
  final Color fontColor;
  final Color iconColor;
  final Color buttonColor;
  final double blurRadius;
  final String buttonText;
  final Color buttonBackground;
  final IconData icon;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: color,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: shadowColor,
                offset: Offset(0.0, 10.0),
                blurRadius: blurRadius)
          ]),
      child: Container(
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                        color: fontColor,
                        fontSize: fontSize,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                        color: fontColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: 140,
                    padding: EdgeInsets.symmetric(
                      // horizontal: 10,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: buttonBackground,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            buttonText,
                            style: TextStyle(
                                color: buttonColor,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Icon(
                            icon,
                            color: iconColor,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: FractionalOffset.centerRight,
              child: Image(
                image: Svg(img),
                // height: imgHeight,
                // width: imgWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
