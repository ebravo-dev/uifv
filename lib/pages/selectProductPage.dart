import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
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

  List<Widget> listBody(double widthScreen) {
    List<Widget> listBody = [];
    listBody.addAll(
      [
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
      ],
    );
    List<Map<String, dynamic>> allProducts = widget.allProducts['plantas'];
    List<Widget> productoActivos = [];
    List<Widget> productoNoActivos = [];
    for (int i = 0; i < allProducts.length; i++) {
      var producto = allProducts[i];
      String nombreProducto = producto['nombre'];
      String idProducto = producto['planta_id'];
      String descripcion = producto['descripcion'];
      String urlImage = producto['foto_url'];
      bool activo = producto['activo'];

      var cartaWidget = ProductWeekCard(
        productName: nombreProducto,
        idProducto: idProducto,
        image: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: CachedNetworkImage(
            imageUrl: urlImage,
            fit: BoxFit.cover,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CupertinoActivityIndicator(),
            errorWidget: (context, url, dynamic error) =>
                const Icon(Icons.error),
          ),
        ),
        productDescription: jsonDecode(descripcion),
        isActive: activo,
        multipleTabsFix: tabsFix,
      );
      if (activo) {
        productoActivos.add(cartaWidget);
      } else {
        productoNoActivos.add(cartaWidget);
      }
    }
    if (productoActivos.length > 0) {
      listBody.add(
        ProductsDivider(
          label: 'Seleccionar Producto',
        ),
      );
      listBody.addAll(productoActivos);
    }
    if (productoNoActivos.length > 0) {
      listBody.add(
        ProductsDivider(
          label: 'Proximamente',
        ),
      );
      listBody.addAll(productoNoActivos);
    }
    return listBody;
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
            children: listBody(widthScreen),
          ),
          // color: Colors.pink,
        ),
      ),
    );
  }
}
