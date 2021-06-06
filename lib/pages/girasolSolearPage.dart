import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui2/utils/fix.dart';
import 'package:ui2/values/colors.dart';

class SolearPage extends StatelessWidget {
  final AuxEstadoEvento estadoEvento;
  final Function refreshEvent;

  const SolearPage({Key key, this.estadoEvento, this.refreshEvent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  color: Color(0xFF5F283D),
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
          children: [
            Text(
              'Girasol',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w500,
                color: Color(0xFF5F283D),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Mantener la planta soleada',
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Text(
                    '1',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontFamily: 'nunito',
                    ),
                  ),
                  backgroundColor: Color(0xFF5F283D),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Text(
                    'Es importante que los girasoles reciban siempre luz directa del sol para crecer correctamente y recibir todo lo que necesitan para desarrollarse y lucir con todo su esplendor',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image(
                  image: AssetImage('assets/img/sunflower-2511961_1280.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Text(
                    '2',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontFamily: 'nunito',
                    ),
                  ),
                  backgroundColor: Color(0xFF5F283D),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Text(
                    'Para que un girasol se desarrolle con normalidad, requiere, como mínimo, seis horas de sol directo, día tras día',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image(
                  image: AssetImage('assets/img/sun-3588618_1280.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
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
                  //Navigator.pop(context);
                  showCupertinoDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (c) {
                        return CupertinoAlertDialog(
                          title: Text('Solear girasol'),
                          content: Text('¿Deseas finalizar esta actividad?'),
                          actions: [
                            CupertinoDialogAction(
                              child: Text('No'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            CupertinoDialogAction(
                              child: Text('Si'),
                              isDefaultAction: true,
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                                estadoEvento.estado = true;
                                refreshEvent();
                              },
                            ),
                          ],
                        );
                      });
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  primary: Color(0xFF5F283D),
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
