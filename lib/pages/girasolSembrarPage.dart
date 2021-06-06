import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui2/utils/fix.dart';
import 'package:ui2/values/colors.dart';

class SembrarGirasol extends StatelessWidget {
  final AuxEstadoEvento estadoEvento;
  final Function refreshEvent;

  const SembrarGirasol({Key key, this.estadoEvento, this.refreshEvent})
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
                  color: Color(0xFF003d64),
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
                color: Color(0xFF003d64),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '¿Cómo iniciar a sembrarlo?',
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
                  backgroundColor: Color(0xFF003d64),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Text(
                    'Poner las pipas o semillas en agua aproximadamente durante una hora. Esto es para hidratarlas y que el proceso de germinado actué mejor.',
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
                  image: AssetImage('assets/img/water-3226252.png'),
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
                  backgroundColor: Color(0xFF003d64),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Text(
                    'El girasol acepta la siembra directa, es decir, donde uno la situé crecerá. Se puede utilizar un semillero para tener mejor control en el proceso de germinado, puedes hacer uso de un vaso de plástico',
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
                  image: AssetImage('assets/img/garden-2253111_1920.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image(
                  image: AssetImage('assets/img/soybeans-1543076_1920.jpg'),
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
                    '3',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontFamily: 'nunito',
                    ),
                  ),
                  backgroundColor: Color(0xFF003d64),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Text(
                    'Puedes colocar de dos a tres semillas por semillero, si el recipiente es pequeño poner una o dos.',
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
              height: 40,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Text(
                    '4',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontFamily: 'nunito',
                    ),
                  ),
                  backgroundColor: Color(0xFF003d64),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Text(
                    'Es posible utilizar tierra rica en nutrientes, o bien puedes sembrarla directamente en la tierra, siempre y cuando remuevas el suelo, aflojando la tierra con un talacho o azadón.',
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
              height: 40,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Text(
                    '5',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontFamily: 'nunito',
                    ),
                  ),
                  backgroundColor: Color(0xFF003d64),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Text(
                    'Puedes agregar composta y deberás humedecer la zona.',
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
              height: 40,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Text(
                    '6',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontFamily: 'nunito',
                    ),
                  ),
                  backgroundColor: Color(0xFF003d64),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Text(
                    'Esta planta es de sol por lo que procura que en la mayoría del día esta pueda recibir los rayos.',
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
              height: 40,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Text(
                    '7',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontFamily: 'nunito',
                    ),
                  ),
                  backgroundColor: Color(0xFF003d64),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Text(
                    'Colocar la semilla aproximadamente a 1cm de profundidad.',
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
              height: 40,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Text(
                    '8',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontFamily: 'nunito',
                    ),
                  ),
                  backgroundColor: Color(0xFF003d64),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Text(
                    'En la etapa joven de la planta es recomendable mantenerla humedecida sin ahogar la planta.',
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
              height: 40,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Text(
                    '9',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontFamily: 'nunito',
                    ),
                  ),
                  backgroundColor: Color(0xFF003d64),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Text(
                    'Puedes regar la planta en la mañana y después en la tarde. En su etapa adulta puedes regar solamente una vez al día, en este momento el girasol puede soportar sequías por tiempo prolongado.',
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
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image(
                  image: AssetImage('assets/img/sunflowers-1091637_1920.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
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
                          title: Text('Sembrar girasol'),
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
                  primary: Color(0xFF003d64),
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
