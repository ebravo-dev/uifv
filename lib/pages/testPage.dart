import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:intl/intl.dart';
import 'package:ui2/widgets/log_activity_card.dart';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 100,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
            (index) => LogActivityCard(
              dateTime: DateTime.now().toIso8601String(),
              urlImage:
                  'https://lh3.googleusercontent.com/proxy/8MHCOJ2VSYaDvyo4TaOVdXuG8Un-AqQzF_UGxNH-XuAJDM4M8Eugs4cnQfELjnc0BWbKp0tI2MkrKEAcj3aPhgg4ze9IZqLMa0Q2al7iTHmJxw',
              productName: 'Girasol',
              activityName: 'Sembrar',
            ),
          ),
        ),
      ),
    );
  }
}
