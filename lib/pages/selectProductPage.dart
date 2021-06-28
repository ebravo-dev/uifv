import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui2/utils/fix.dart';
import 'package:ui2/values/colors.dart';
import 'package:ui2/values/productsOfWeek.dart' as WEEKLYPRODUCTS;
import 'package:ui2/widgets/navigation_button.dart';
import 'package:ui2/widgets/product_week_card.dart';
import 'package:ui2/widgets/products_divider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SelectProductPage extends StatefulWidget {
  final Map<String, dynamic> allProducts;
  SelectProductPage({Key key, this.title, this.allProducts}) : super(key: key);

  final String title;

  @override
  _SelectProductPageState createState() => _SelectProductPageState();
}

class _SelectProductPageState extends State<SelectProductPage> {
  MultipleTabsFix tabsFix = MultipleTabsFix();

  List<Widget> listBody() {
    List<Widget> listBody = [];
    List<Map<String, dynamic>> allProducts = widget.allProducts['plantas'];
    List<Widget> productoActivos = [];
    List<Widget> productoNoActivos = [];
    for (int i = 0; i < allProducts.length; i++) {
      var producto = allProducts[i];
      String nombreProducto = producto['nombre'];
      String idProducto = producto['planta_id'];
      String descripcion = producto['descripcion'];
      String urlImage = producto['foto_url'];
      ProductWeekCard(
        productName: nombreProducto,
        image: CachedNetworkImage(
          imageUrl: urlImage,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              CircularProgressIndicator(value: downloadProgress.progress),
          errorWidget: (context, url, dynamic error) => const Icon(Icons.error),
        ),
        productDescription: jsonDecode(WEEKLYPRODUCTS.sunFlower['description']),
        isActive: WEEKLYPRODUCTS.sunFlower['isActive'],
        multipleTabsFix: tabsFix,
      );
      if (producto['activo'] == true) {}
    }
  }

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
                productDescription:
                    jsonDecode(WEEKLYPRODUCTS.sunFlower['description']),
                isActive: WEEKLYPRODUCTS.sunFlower['isActive'],
                multipleTabsFix: tabsFix,
              ),
              ProductsDivider(
                label: 'Proximamente',
              ),
              ProductWeekCard(
                productName: WEEKLYPRODUCTS.chili['name'],
                image: WEEKLYPRODUCTS.chili['image'],
                productDescription:
                    jsonDecode(WEEKLYPRODUCTS.sunFlower['description']),
                isActive: WEEKLYPRODUCTS.chili['isActive'],
                multipleTabsFix: tabsFix,
              ),
              ProductWeekCard(
                productName: WEEKLYPRODUCTS.strawberry['name'],
                image: WEEKLYPRODUCTS.strawberry['image'],
                productDescription:
                    jsonDecode(WEEKLYPRODUCTS.sunFlower['description']),
                isActive: WEEKLYPRODUCTS.strawberry['isActive'],
                multipleTabsFix: tabsFix,
              ),
              ProductWeekCard(
                productName: WEEKLYPRODUCTS.egg['name'],
                image: WEEKLYPRODUCTS.egg['image'],
                productDescription:
                    jsonDecode(WEEKLYPRODUCTS.sunFlower['description']),
                isActive: WEEKLYPRODUCTS.egg['isActive'],
                multipleTabsFix: tabsFix,
              ),
              ProductWeekCard(
                productName: WEEKLYPRODUCTS.garlic['name'],
                image: WEEKLYPRODUCTS.garlic['image'],
                productDescription:
                    jsonDecode(WEEKLYPRODUCTS.sunFlower['description']),
                isActive: WEEKLYPRODUCTS.garlic['isActive'],
                multipleTabsFix: tabsFix,
              ),
              ProductWeekCard(
                productName: WEEKLYPRODUCTS.lettuce['name'],
                image: WEEKLYPRODUCTS.lettuce['image'],
                productDescription:
                    jsonDecode(WEEKLYPRODUCTS.sunFlower['description']),
                isActive: WEEKLYPRODUCTS.lettuce['isActive'],
                multipleTabsFix: tabsFix,
              ),
              ProductWeekCard(
                productName: WEEKLYPRODUCTS.carrot['name'],
                image: WEEKLYPRODUCTS.carrot['image'],
                productDescription:
                    jsonDecode(WEEKLYPRODUCTS.sunFlower['description']),
                isActive: WEEKLYPRODUCTS.carrot['isActive'],
                multipleTabsFix: tabsFix,
              ),
              ProductWeekCard(
                productName: WEEKLYPRODUCTS.tomatoes['name'],
                image: WEEKLYPRODUCTS.tomatoes['image'],
                productDescription:
                    jsonDecode(WEEKLYPRODUCTS.sunFlower['description']),
                isActive: WEEKLYPRODUCTS.tomatoes['isActive'],
                multipleTabsFix: tabsFix,
              ),
              ProductWeekCard(
                productName: WEEKLYPRODUCTS.avocado['name'],
                image: WEEKLYPRODUCTS.avocado['image'],
                productDescription:
                    jsonDecode(WEEKLYPRODUCTS.sunFlower['description']),
                isActive: WEEKLYPRODUCTS.avocado['isActive'],
                multipleTabsFix: tabsFix,
              ),
            ],
          ),
          // color: Colors.pink,
        ),
      ),
    );
  }
}
