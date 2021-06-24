import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:ui2/utils/fix.dart';
import 'package:ui2/utils/ux_methods.dart';

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
      @required this.img,
      this.onTap,
      this.tabsFix,
      this.contenidoConstante,
      this.activado});
  final MultipleTabsFix tabsFix;
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
  final Function onTap;
  final Widget contenidoConstante;
  final AuxEstadoEvento activado;

  @override
  Widget build(BuildContext context) {
    bool pushFixFlag = false;
    return InkWell(
      onTap: () async {
        if (!pushFixFlag && tabsFix.isAviableTabAction) {
          pushFixFlag = true;
          tabsFix.isAviableTabAction = false;
          await waitInkWellAnimation();
          Navigator.push(context, MaterialPageRoute(builder: (c) {
            return contenidoConstante;
          })).whenComplete(() {
            pushFixFlag = false;
            tabsFix.isAviableTabAction = true;
          });
        }
      },
      splashFactory: InkRipple.splashFactory,
      borderRadius: BorderRadius.circular(20.0),
      child: Ink(
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              color: fontColor,
                              fontSize: fontSize,
                              fontWeight: FontWeight.w600),
                        ),
                        AnimatedOpacity(
                          opacity: 1,
                          duration: Duration(milliseconds: 300),
                          child: Container(
                            padding: EdgeInsets.only(
                              left: 5,
                              top: 3,
                            ),
                            child: Icon(
                              Icons.check,
                              size: 22,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: fontColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'montserrat',
                        letterSpacing: 1.3,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: 140,
                      padding: EdgeInsets.symmetric(
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
