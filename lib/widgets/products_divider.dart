import 'package:flutter/material.dart';

class ProductsDivider extends StatelessWidget {
  final String label;

  const ProductsDivider({Key key, @required this.label}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(
        top: 30,
        bottom: 15,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 30,
          ),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            width: 30,
          ),
        ],
      ),
    );
  }
}
