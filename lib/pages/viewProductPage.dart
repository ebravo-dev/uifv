import 'package:flutter/material.dart';

class ViewProductPage extends StatelessWidget {
  final Widget imageHero;
  final String productName;

  const ViewProductPage({Key key, this.imageHero, this.productName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Hero(
          tag: productName,
          child: Container(
            width: 144,
            height: 144,
            child: imageHero,
          ),
        ),
      ),
    );
  }
}
