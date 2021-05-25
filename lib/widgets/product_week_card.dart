import 'package:flutter/material.dart';
import 'package:ui2/pages/viewProductPage.dart';
import 'package:ui2/utils/ux_methods.dart';

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
    return Opacity(
      opacity: isActive ? 1 : 0.4,
      child: Container(
        // margin: EdgeInsets.only(top: 30),
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
                                  //fontFamily: 'Montserrat',
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              productDescription,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              isActive ? 'Ver más' : 'Proximamente',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 25),
                      Hero(
                        tag: productName,
                        child: Container(
                          width: 80,
                          height: 80,
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
      ),
    );
  }
}
