import 'package:flutter/material.dart';
import 'package:ui2/pages/viewProductPage.dart';
import 'package:ui2/utils/ux_methods.dart';
import 'package:ui2/values/colors.dart';

class ProductWeekCard extends StatelessWidget {
  final String productName;
  final String productDescription;
  final Widget image;
  final bool isActive;
  final double _borderRadius = 18;

  const ProductWeekCard({
    Key key,
    @required this.productName,
    @required this.image,
    @required this.productDescription,
    @required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      foregroundDecoration: isActive
          ? null
          : BoxDecoration(
              color: Colors.grey,
              backgroundBlendMode: BlendMode.saturation,
            ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () async {
            await waitInkWellAnimation();
            Navigator.push(context, MaterialPageRoute(builder: (c) {
              return ViewProductPage(
                productName: productName,
                imageHero: image,
              );
            }));
          },
          splashFactory: InkRipple.splashFactory,
          child: Container(
            // width: 360,
            padding: EdgeInsets.symmetric(
              // vertical: 20,
              horizontal: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productName,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              //fontFamily: 'Nunito',
                              color: loginPrimaryColor,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            productDescription,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            //textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Colors.grey.shade800,
                              fontSize: 16,
                              fontFamily: 'Nunito',
                            ),
                          ),
                          // SizedBox(
                          //   height: 15,
                          // ),
                          // Text(
                          //   isActive ? 'Ver más' : 'Proximamente',
                          //   style: TextStyle(
                          //     color: loginSplashColor,
                          //     fontSize: 16,
                          //     fontFamily: 'Nunito',
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Hero(
                      tag: productName,
                      child: Container(
                        width: 70,
                        height: 70,
                        child: image,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 0.5,
                  color: Colors.grey.shade200,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
