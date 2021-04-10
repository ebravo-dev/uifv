import 'dart:math';
import 'package:flutter/material.dart';

class ProductWeekCard extends StatelessWidget {
  final String productName;
  final Transform image;
  final Color color;

  const ProductWeekCard(
      {Key key,
      @required this.productName,
      @required this.image,
      @required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        width: 340,
        height: 100,
        margin: EdgeInsets.only(top: 70, bottom: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: color,
        ),
        child: Stack(
          overflow: Overflow.visible,
          children: [
            Positioned(
              top: -55,
              left: 30,
              child: image,
            ),
            Positioned(
              right: 22,
              top: 24,
              child: Text(
                'Seleccionar producto  ',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Positioned(
              right: 27,
              top: 50,
              width: 135,
              child: Container(
                // color: Colors.red,
                child: Text(
                  productName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 10,
              top: 10,
              child: Icon(
                Icons.circle,
                color: Colors.white,
                size: 6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
