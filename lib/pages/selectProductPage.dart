import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:ui2/values/productsOfWeek.dart' as WEEKLYPRODUCTS;
import 'package:ui2/widgets/navigation_button.dart';
import 'package:ui2/widgets/product_week_card.dart';

class SelectProductPage extends StatefulWidget {
  SelectProductPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SelectProductPageState createState() => _SelectProductPageState();
}

class _SelectProductPageState extends State<SelectProductPage> {
  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(20),
          child: Container(
            margin: EdgeInsets.only(bottom: 10),
            width: 340,
            child: Row(
              children: [
                NavigationButton(
                  icon: Icons.menu,
                  action: () {},
                  barckgroundColor: Color(0xfff7f8f9),
                ),
                Expanded(
                  child: SizedBox(),
                ),
                NavigationButton(
                  action: () {},
                  barckgroundColor: Colors.indigo.shade300,
                ),
              ],
            ),
          ),
        ),
        brightness: Brightness.light,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: widthScreen,
              height: 15,
            ),
            Text(
              'Hola Ricardo',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                color: Colors.indigo.shade400,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Cual producto escogerás?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 340,
              padding: EdgeInsets.symmetric(
                vertical: 6,
                horizontal: 20,
              ),
              margin: EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                color: Color(0xfff7f8f9),
                borderRadius: BorderRadius.circular(18),
              ),
              child: TextField(
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey.shade800,
                ),
                decoration: InputDecoration(
                  hintText: 'Buscar producto...',
                  hintStyle: TextStyle(color: Color(0xff9ca5ae)),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            ProductWeekCard(
              productName: WEEKLYPRODUCTS.garlic['name'],
              image: WEEKLYPRODUCTS.garlic['image'],
              color: WEEKLYPRODUCTS.garlic['color'],
            ),
            ProductWeekCard(
              productName: WEEKLYPRODUCTS.lettuce['name'],
              image: WEEKLYPRODUCTS.lettuce['image'],
              color: WEEKLYPRODUCTS.lettuce['color'],
            ),
            ProductWeekCard(
              productName: WEEKLYPRODUCTS.carrot['name'],
              image: WEEKLYPRODUCTS.carrot['image'],
              color: WEEKLYPRODUCTS.carrot['color'],
            ),
            ProductWeekCard(
              productName: WEEKLYPRODUCTS.egg['name'],
              image: WEEKLYPRODUCTS.egg['image'],
              color: WEEKLYPRODUCTS.egg['color'],
            ),
            ProductWeekCard(
              productName: WEEKLYPRODUCTS.chili['name'],
              image: WEEKLYPRODUCTS.chili['image'],
              color: WEEKLYPRODUCTS.chili['color'],
            ),
            ProductWeekCard(
              productName: WEEKLYPRODUCTS.tomatoes['name'],
              image: WEEKLYPRODUCTS.tomatoes['image'],
              color: WEEKLYPRODUCTS.tomatoes['color'],
            ),
            ProductWeekCard(
              productName: WEEKLYPRODUCTS.avocado['name'],
              image: WEEKLYPRODUCTS.avocado['image'],
              color: WEEKLYPRODUCTS.avocado['color'],
            ),
          ],
        ),
      ),
    );
  }
}
