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
              "nombre": "girasol",
              "activo": true,
              "descripcion":
                  '{"Beneficios":"Las semillas de girasol se caracterizan por ser ricas en vitamina E, lo que les confiere diversas propiedades.\\n\\nEsta vitamina es un potente antioxidante, lo que ayuda a mantener sanas las células y con ello evitar diversas enfermedades.\\n\\nPor ejemplo, evitan que se oxide el colesterol, impidiendo así que se adhiera a las paredes de los vasos sanguíneos, reduciendo el riesgo de eventos cardiovasculares.","Sabias que":"También se les llama maíz de teja, debido a que los habitantes del pequeño poblado de Pinal de Amoles en Querétaro, donde el atole de esa semilla es tradicional, dejaban secar sobre las tejas de sus casas.","¿Las semillas de girasol engordan?":"Todo depende de cuánto comas. Ciertamente no son bajas en calorías. 100 gramos de semillas de girasol proporcionan 584 kcal. Veamos en detalle los valores nutricionales de las semillas de girasol."}',
              "foto_url":
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdSI_I190gm5-zzj6MEF_6e0HWJ4CZZvs6Tg&usqp=CAU',
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
              "descripcion":
                  '{"Beneficios":"Las semillas de girasol se caracterizan por ser ricas en vitamina E, lo que les confiere diversas propiedades.\\n\\nEsta vitamina es un potente antioxidante, lo que ayuda a mantener sanas las células y con ello evitar diversas enfermedades.\\n\\nPor ejemplo, evitan que se oxide el colesterol, impidiendo así que se adhiera a las paredes de los vasos sanguíneos, reduciendo el riesgo de eventos cardiovasculares.","Sabias que":"También se les llama maíz de teja, debido a que los habitantes del pequeño poblado de Pinal de Amoles en Querétaro, donde el atole de esa semilla es tradicional, dejaban secar sobre las tejas de sus casas.","¿Las semillas de girasol engordan?":"Todo depende de cuánto comas. Ciertamente no son bajas en calorías. 100 gramos de semillas de girasol proporcionan 584 kcal. Veamos en detalle los valores nutricionales de las semillas de girasol."}',
              "foto_url":
                  'https://s1.eestatic.com/2020/04/28/ciencia/nutricion/fresas-frutas-nutriologia_485962162_151094680_1024x576.jpg',
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
