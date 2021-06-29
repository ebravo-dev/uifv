import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:csv/csv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
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
            1,
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
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        child: Icon(Icons.share),
        backgroundColor: Color(0xff03568c),
        onPressed: () async {
          List encabezado = ['Producto', 'Actividad', 'Fecha'];
          String csv = const ListToCsvConverter().convert([
            encabezado,
            ['Girasol', 'Solear', '29 Jun 2021, 13:03 PM'],
            ['Fresa', 'Regar', '28 Jun 2021, 16:03 PM'],
            ['Fresa', 'Regar', '27 Jun 2021, 17:03 PM'],
            ['Girasol', 'Regar', '26 Jun 2021, 16:03 PM'],
            ['Fresa', 'Sembrar', '25 Jun 2021, 15:03 PM'],
            ['Girasol', 'Sembrar', '24 Jun 2021, 16:03 PM'],
          ]);
          final directory = await getApplicationDocumentsDirectory();
          final pathOfTheFileToWrite = directory.path + "/myCsvFile.csv";
          File file = File(pathOfTheFileToWrite);
          await file.writeAsString(csv);
          await Share.shareFiles(['${directory.path}/myCsvFile.csv'],
              text: 'Great picture');
        },
      ),
    );
  }
}
