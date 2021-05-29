import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui2/values/colors.dart';
import 'package:ui2/values/productsOfWeek.dart' as WEEKLYPRODUCTS;
import 'package:ui2/widgets/navigation_button.dart';
import 'package:ui2/widgets/product_week_card.dart';
import 'package:ui2/widgets/products_divider.dart';

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
                  barckgroundColor: loginSplashColor,
                ),
              ],
            ),
          ),
        ),
        brightness: Brightness.light,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 80),
        physics: BouncingScrollPhysics(),
        child: Container(
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
                  color: loginPrimaryColor,
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
              ProductsDivider(
                label: 'Seleccionar Producto',
              ),
              ProductWeekCard(
                productName: WEEKLYPRODUCTS.sunFlower['name'],
                image: WEEKLYPRODUCTS.sunFlower['image'],
                productDescription: WEEKLYPRODUCTS.sunFlower['description'],
                isActive: WEEKLYPRODUCTS.sunFlower['isActive'],
              ),
              ProductWeekCard(
                productName: WEEKLYPRODUCTS.chili['name'],
                image: WEEKLYPRODUCTS.chili['image'],
                productDescription: WEEKLYPRODUCTS.chili['description'],
                isActive: WEEKLYPRODUCTS.chili['isActive'],
              ),
              ProductWeekCard(
                productName: WEEKLYPRODUCTS.strawberry['name'],
                image: WEEKLYPRODUCTS.strawberry['image'],
                productDescription: WEEKLYPRODUCTS.strawberry['description'],
                isActive: WEEKLYPRODUCTS.strawberry['isActive'],
              ),
              ProductWeekCard(
                productName: WEEKLYPRODUCTS.egg['name'],
                image: WEEKLYPRODUCTS.egg['image'],
                productDescription: WEEKLYPRODUCTS.egg['description'],
                isActive: WEEKLYPRODUCTS.egg['isActive'],
              ),
              ProductsDivider(
                label: 'Proximamente',
              ),
              ProductWeekCard(
                productName: WEEKLYPRODUCTS.garlic['name'],
                image: WEEKLYPRODUCTS.garlic['image'],
                productDescription: WEEKLYPRODUCTS.garlic['description'],
                isActive: WEEKLYPRODUCTS.garlic['isActive'],
              ),
              ProductWeekCard(
                productName: WEEKLYPRODUCTS.lettuce['name'],
                image: WEEKLYPRODUCTS.lettuce['image'],
                productDescription: WEEKLYPRODUCTS.lettuce['description'],
                isActive: WEEKLYPRODUCTS.lettuce['isActive'],
              ),
              ProductWeekCard(
                productName: WEEKLYPRODUCTS.carrot['name'],
                image: WEEKLYPRODUCTS.carrot['image'],
                productDescription: WEEKLYPRODUCTS.carrot['description'],
                isActive: WEEKLYPRODUCTS.carrot['isActive'],
              ),
              ProductWeekCard(
                productName: WEEKLYPRODUCTS.tomatoes['name'],
                image: WEEKLYPRODUCTS.tomatoes['image'],
                productDescription: WEEKLYPRODUCTS.tomatoes['description'],
                isActive: WEEKLYPRODUCTS.tomatoes['isActive'],
              ),
              ProductWeekCard(
                productName: WEEKLYPRODUCTS.avocado['name'],
                image: WEEKLYPRODUCTS.avocado['image'],
                productDescription: WEEKLYPRODUCTS.avocado['description'],
                isActive: WEEKLYPRODUCTS.avocado['isActive'],
              ),
            ],
          ),
          // color: Colors.pink,
        ),
      ),
    );
  }
}
