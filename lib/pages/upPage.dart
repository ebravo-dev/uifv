import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:ui2/utils/ux_methods.dart';
import 'package:ui2/values/colors.dart';
import 'package:ui2/widgets/custom_large_button.dart';
import 'package:ui2/widgets/custom_or_divider.dart';

import 'package:ui2/widgets/navigation_button.dart';
import 'package:ui2/widgets/network_login_row.dart';
import 'package:ui2/widgets/password_input.dart';

class UpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Nunito',
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          alignment: Alignment.center,
          child: Container(
            width: 600,
            padding: EdgeInsets.only(
              right: 40,
              left: 40,
            ),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 45,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Crear Cuenta',
                          style: TextStyle(
                            color: upPrimaryColor,
                            fontSize: 28,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      NavigationButton(
                        icon: EvaIcons.arrowIosBack,
                        action: () {
                          Navigator.pop(context);
                        },
                        barckgroundColor: Color(0xfffffff),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    'Ingresar Credencial',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Nombre Completo',
                      contentPadding: EdgeInsets.all(26),
                      prefixIcon: Icon(
                        Icons.person_outline,
                      ),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Correo',
                      contentPadding: EdgeInsets.all(26),
                      prefixIcon: Icon(
                        Icons.alternate_email,
                      ),
                    ),
                  ),
                  PasswordInput(),
                  SizedBox(
                    height: 40,
                  ),
                  CustomLargeButton(
                    action: () {
                      changestatusBarColorTransparent();
                      showCupertinoDialog(
                        context: context,
                        builder: (c) {
                          return loadingDialog(
                            label: 'Creando Cuenta',
                            color: upPrimaryColor,
                          );
                        },
                      ).whenComplete(() {
                        restoreStatusBarColor();
                      });
                    },
                    backgroundColor: upPrimaryColor,
                    splash: upSplashColor,
                    label: 'Registrarme',
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  OrDivider(),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Crear con',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  NetWorkLogin(
                    ffacebook: () {},
                    ftwitter: () {},
                    fgoogle: () {},
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '¿Ya tienes cuenta?',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.all(0),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Inicia Sesión',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: upPrimaryColor,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
