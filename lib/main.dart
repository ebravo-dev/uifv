import 'package:flutter/material.dart';
import 'package:ui2/pages/activitiesPage.dart';
import 'package:ui2/pages/logActivityPage.dart';
import 'package:ui2/pages/mapaPage.dart';
import 'package:ui2/pages/selectProductPage.dart';
import 'package:ui2/pages/splashPage.dart';
import 'package:ui2/utils/ux_methods.dart';

void main() {
  changeStatusBarColorWhiteOp80();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FV',
      themeMode: ThemeMode.light,
      theme: ThemeData.light(),
      // home: MapaPage(),
      // home: SelectProductPage(),
      home: SelectProductPage(
        // idActivatesProducts: ['idgirasol', 'idfresa'],
        allProducts: {
          "plantas": [
            {
              "planta_id": "idgirasol",
              "nombre": "huevo",
              "activo": true,
              "descripcion": "alguna descripcion",
              "foto_url":
                  'https://cdn.ticbeat.com/src/uploads/2018/02/por-que-aceptar-bebida-entrevista-trabajo-810x540.jpg',
              "actividades": [
                {
                  "actividad_id": "act111",
                  "fecha_de_creacion": "la fecha",
                  "actividad_diaria": false,
                  "titulo": "Formar gallinero",
                  "icon_name": "gallinero(1).svg",
                  "subtitulo": "¿Cómo iniciar a sembrarlo?",
                  "contenido": [
                    {
                      "multimedia": [
                        {
                          "tipo": "imagen",
                          "url":
                              "https://cdn.ticbeat.com/src/uploads/2018/02/por-que-aceptar-bebida-entrevista-trabajo-810x540.jpg"
                        },
                      ],
                      "texto": "Poner las pipas o semillas en agua"
                    },
                    {
                      "multimedia": [
                        {
                          "tipo": "imagen",
                          "url":
                              "https://cdn.ticbeat.com/src/uploads/2018/02/por-que-aceptar-bebida-entrevista-trabajo-810x540.jpg"
                        },
                        {
                          "tipo": "imagen",
                          "url":
                              "https://cdn.ticbeat.com/src/uploads/2018/02/por-que-aceptar-bebida-entrevista-trabajo-810x540.jpg"
                        }
                      ],
                      "texto": "El girasol se siembra asi"
                    }
                  ]
                },
                {
                  "actividad_id": "act211",
                  "fecha_de_creacion": "la fecha",
                  "actividad_diaria": true,
                  "titulo": "Recolectar",
                  "icon_name": "huevos.svg",
                  "subtitulo": "Mantener la planta soleada",
                  "contenido": [
                    {
                      "multimedia": [
                        {
                          "tipo": "imagen",
                          "url":
                              "https://cdn.ticbeat.com/src/uploads/2018/02/por-que-aceptar-bebida-entrevista-trabajo-810x540.jpg"
                        },
                      ],
                      "texto": "Poner las pipas o semillas en agua"
                    },
                    {
                      "multimedia": [
                        {
                          "tipo": "imagen",
                          "url":
                              "https://cdn.ticbeat.com/src/uploads/2018/02/por-que-aceptar-bebida-entrevista-trabajo-810x540.jpg"
                        },
                        {
                          "tipo": "imagen",
                          "url":
                              "https://cdn.ticbeat.com/src/uploads/2018/02/por-que-aceptar-bebida-entrevista-trabajo-810x540.jpg"
                        }
                      ],
                      "texto": "El girasol se siembra asi"
                    }
                  ]
                }
              ]
            },
            {
              "planta_id": "idfresa",
              "nombre": "fresa",
              "activo": false,
              "descripcion": "alguna descripcion",
              "actividades": [
                {
                  "actividad_id": "act311",
                  "fecha_de_creacion": "la fecha",
                  "actividad_diaria": false,
                  "titulo": "Sembrar",
                  "icon_name": "maceta.svg",
                  "subtitulo": "¿Cómo iniciar a sembrarlo?",
                  "contenido": [
                    {
                      "multimedia": [
                        {
                          "tipo": "imagen",
                          "url":
                              "https://cdn.ticbeat.com/src/uploads/2018/02/por-que-aceptar-bebida-entrevista-trabajo-810x540.jpg"
                        },
                      ],
                      "texto": "Poner las pipas o semillas en agua"
                    },
                    {
                      "multimedia": [
                        {
                          "tipo": "imagen",
                          "url":
                              "https://cdn.ticbeat.com/src/uploads/2018/02/por-que-aceptar-bebida-entrevista-trabajo-810x540.jpg"
                        },
                        {
                          "tipo": "imagen",
                          "url":
                              "https://cdn.ticbeat.com/src/uploads/2018/02/por-que-aceptar-bebida-entrevista-trabajo-810x540.jpg"
                        }
                      ],
                      "texto": "La fresa se siembra asi"
                    }
                  ]
                },
                {
                  "actividad_id": "act411",
                  "fecha_de_creacion": "la fecha",
                  "actividad_diaria": true,
                  "titulo": "Solear",
                  "icon_name": "dom.svg",
                  "subtitulo": "Mantener la planta soleada",
                  "contenido": [
                    {
                      "multimedia": [
                        {
                          "tipo": "imagen",
                          "url":
                              "https://cdn.ticbeat.com/src/uploads/2018/02/por-que-aceptar-bebida-entrevista-trabajo-810x540.jpg"
                        },
                      ],
                      "texto": "Poner las pipas o semillas en agua"
                    },
                    {
                      "multimedia": [
                        {
                          "tipo": "imagen",
                          "url":
                              "https://cdn.ticbeat.com/src/uploads/2018/02/por-que-aceptar-bebida-entrevista-trabajo-810x540.jpg"
                        },
                        {
                          "tipo": "imagen",
                          "url":
                              "https://cdn.ticbeat.com/src/uploads/2018/02/por-que-aceptar-bebida-entrevista-trabajo-810x540.jpg"
                        }
                      ],
                      "texto": "La fresa se siembra asi"
                    }
                  ]
                },
              ]
            }
          ]
        },
      ),
    );
  }
}
