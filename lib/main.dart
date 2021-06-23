import 'package:flutter/material.dart';
import 'package:ui2/pages/activitiesPage.dart';
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
      home: EventsPage(
        idActivatesProducts: ['idgirasol', 'idfresa'],
        allProducts: {
          "plantas": [
            {
              "planta_id": "idgirasol",
              "nombre": "girasol",
              "activo": true,
              "descripcion": "alguna descripcion",
              "actividades": [
                {
                  "actividad_id": "act1",
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
                      "texto": "El girasol se siembra asi"
                    }
                  ]
                },
                {
                  "actividad_id": "act2",
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
                      "texto": "El girasol se siembra asi"
                    }
                  ]
                }
              ]
            },
            {
              "planta_id": "idfresa",
              "nombre": "fresa",
              "activo": true,
              "descripcion": "alguna descripcion",
              "actividades": [
                {
                  "actividad_id": "act3",
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
                  "actividad_id": "act4",
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
                }
              ]
            }
          ]
        },
      ),
    );
  }
}
