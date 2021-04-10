import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 2,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: Colors.grey.shade400,
          ),
        ),
        SizedBox(
          width: 17,
        ),
        Text(
          'O',
          style: TextStyle(
            color: Colors.grey.shade400,
          ),
        ),
        SizedBox(
          width: 17,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: Colors.grey.shade400,
          ),
        ),
        SizedBox(
          width: 2,
        ),
      ],
    );
  }
}
