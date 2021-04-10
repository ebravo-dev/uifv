import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/services.dart';
import 'package:ui2/pages/loadingPage.dart';
import 'package:ui2/pages/upPage.dart';
import 'package:ui2/utils/ux_methods.dart';
import 'package:ui2/values/colors.dart';
import 'package:ui2/widgets/custom_large_button.dart';
import 'package:ui2/widgets/custom_or_divider.dart';

import 'package:ui2/widgets/navigation_button.dart';
import 'package:ui2/widgets/network_login_row.dart';
import 'package:ui2/widgets/password_input.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primarySwatch: Colors.teal,
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
                          'Bienvenido',
                          style: TextStyle(
                            color: loginPrimaryColor,
                            fontSize: 28,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      NavigationButton(
                        icon: EvaIcons.arrowIosBack,
                        action: () {},
                        barckgroundColor: Color(0xfffffff),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Iniciar sesión',
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
                      hintText: 'Correo',
                      contentPadding: EdgeInsets.all(26),
                      prefixIcon: Icon(
                        Icons.alternate_email,
                      ),
                    ),
                  ),
                  PasswordInput(
                    controller: null,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.all(0),
                    ),
                    child: Text(
                      'Recuperar Contraseña',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: loginPrimaryColor,
                      ),
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomLargeButton(
                    action: () {
                      changestatusBarColorTransparent();
                      showCupertinoDialog(
                        context: context,
                        builder: (c) {
                          return loadingDialog(
                            label: 'Iniciando Sesión',
                            color: loginPrimaryColor,
                          );
                        },
                      ).whenComplete(() {
                        restoreStatusBarColor();
                      });
                    },
                    backgroundColor: loginPrimaryColor,
                    splash: loginSplashColor,
                    label: 'Acceder',
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  OrDivider(),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Ingresar con',
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
                        '¿No tienes cuenta?',
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (c) => UpPage()),
                          );
                        },
                        child: Text(
                          'Crea Una',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: loginPrimaryColor,
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
