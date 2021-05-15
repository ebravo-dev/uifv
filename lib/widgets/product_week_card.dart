import 'package:flutter/material.dart';

class ProductWeekCard extends StatelessWidget {
  final String productName;
  final String productDescription;
  final Widget image;
  final Color color;
  final bool isActive;
  final double _borderRadius = 18;

  const ProductWeekCard({
    Key key,
    @required this.productName,
    @required this.image,
    @required this.color,
    @required this.productDescription,
    @required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_borderRadius),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 0.3,
            blurRadius: 8,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          splashFactory: InkRipple.splashFactory,
          borderRadius: BorderRadius.circular(_borderRadius),
          child: Container(
            width: 360,
            padding: EdgeInsets.symmetric(
              vertical: 22,
              horizontal: 32,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productName,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            productDescription,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            isActive ? 'Ver más' : 'Proximamente',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 25),
                    Container(
                      width: 90,
                      height: 90,
                      child: image,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
