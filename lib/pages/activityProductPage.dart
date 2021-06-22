import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui2/databases/UserActivities.dart';
import 'package:ui2/utils/fix.dart';
import 'package:ui2/values/colors.dart';

class ActivityProductPage extends StatelessWidget {
  final AuxEstadoEvento estadoEvento;
  final Function refreshEvent;
  final String nombreProducto;
  final String subtitulo;
  final List<Map<String, dynamic>> contenido;
  final Color colorPage;
  final String actividadId;
  final String productoId;

  const ActivityProductPage({
    Key key,
    this.estadoEvento,
    this.refreshEvent,
    this.nombreProducto,
    this.subtitulo,
    this.contenido,
    this.colorPage,
    this.actividadId,
    this.productoId,
  }) : super(key: key);

  List<Widget> listBody() {
    List<Widget> body = [];
    body.addAll([
      Text(
        nombreProducto[0].toUpperCase() +
            nombreProducto.substring(1).toLowerCase(),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w500,
          color: colorPage,
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        subtitulo,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
      SizedBox(
        height: 60,
      ),
    ]);
    int th = 0;
    contenido.forEach((element) {
      Map<String, dynamic> step = element;
      body.add(
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                child: Text(
                  (++th).toString(),
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontFamily: 'nunito',
                  ),
                ),
                backgroundColor: colorPage,
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: Text(
                  step['texto'],
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
      List<Map<String, dynamic>> multimedia = step['multimedia'];
      if (multimedia.isNotEmpty) {
        multimedia.forEach((itemMultimedia) {
          if (itemMultimedia['tipo'] == 'imagen') {
            body.add(
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                margin: EdgeInsets.only(bottom: 40, top: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(
                    itemMultimedia['url'],
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            );
          } else if (itemMultimedia['tipo'] == 'video') {
            //implementar widget de video
            //Poner el mismo pagging que la imagen para obtener mismo tamaño
            //Poner el mismo margin que la imagen para obtener mismas distancias en la lista
          }
        });
      }
    });
    return body;
  }

  @override
  Widget build(BuildContext context) {
    listBody();
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
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: colorPage,
                ),
              ],
            ),
          ),
        ),
        brightness: Brightness.light,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          top: 15,
          bottom: 130,
          right: 20,
          left: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: listBody(),
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(left: 33, bottom: 10, top: 10),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  showCupertinoDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (c) {
                        return AlertDialog(
                          title: Text('Sembrar girasol'),
                          content: Text('¿Deseas finalizar esta actividad?'),
                          actions: [
                            TextButton(
                              child: Text('No'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            TextButton(
                              child: Text(
                                'Si',
                              ),
                              onPressed: () async {
                                // Navigator.pop(context);
                                // Navigator.pop(context);
                                //estadoEvento.estado = true;
                                //refreshEvent();
                                var dbUser = UserActivitiesProvider();
                                await dbUser.open('actividades_usuario');
                                await dbUser
                                    .insert(UserActivities(
                                  actividadId: actividadId,
                                  productoId: productoId,
                                  fecha: DateTime.now().toIso8601String(),
                                ))
                                    .then((value) {
                                  print(value.id);
                                });
                                await dbUser.close();
                                showCupertinoDialog(
                                    context: context,
                                    builder: (c) {
                                      return AlertDialog(
                                        title: Text('Guardado'),
                                        content: Text(
                                            'Haz sumado una nueva acción a tu progreso'),
                                        actions: [
                                          TextButton(
                                            child: Text('ok'),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              },
                            ),
                          ],
                        );
                      });
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  primary: colorPage,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                ),
                child: Text(
                  'Finalizar tarea',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
