import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:ui2/databases/UserActivities.dart';
import 'package:ui2/databases/nameDb.dart';
import 'package:ui2/pages/activityProductPage.dart';
import 'package:ui2/pages/girasolRegarPage.dart';
import 'package:ui2/pages/girasolSembrarPage.dart';
import 'package:ui2/pages/girasolSolearPage.dart';
import 'package:ui2/utils/fix.dart';
import 'package:ui2/values/colors.dart';
import 'package:ui2/widgets/divine_card.dart';
import 'package:ui2/widgets/navigation_button.dart';
import 'package:ui2/widgets/products_divider.dart';

class EventsPage extends StatefulWidget {
  final Map<String, dynamic> allProducts;
  final List<String> idActivatesProducts;

  const EventsPage(
      {Key key, @required this.allProducts, this.idActivatesProducts})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return EventsPageState();
  }
}

class EventsPageState extends State<EventsPage> {
  final MultipleTabsFix tabsFix = MultipleTabsFix();
  final AuxEstadoEvento siSembrar = AuxEstadoEvento();
  final AuxEstadoEvento siSolear = AuxEstadoEvento();
  final AuxEstadoEvento siRegar = AuxEstadoEvento();

  void refresh() {
    Future.delayed(Duration(milliseconds: 400)).whenComplete(() {
      if (mounted)
        setState(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Guarda y observa el progreso de tus productos. Dirigite a menu -> capturas',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
          );
        });
    });
  }

  @override
  void initState() {
    super.initState();
  }

  // Future<dynamic> getCompleteActivities() async {
  //   var db = UserActivitiesProvider();
  //   await db.open(actividadesDBNAME);
  //   var actividades = await db.getActivities(
  //     productosActivos: widget.idActivatesProducts,
  //   );
  //   await db.close();
  //   return actividades;
  // }

  Widget activityCard({
    String accion,
    String nombreProducto,
    String subtitulo,
    String icono,
    Color color,
    Color subColor,
    List<Map<String, dynamic>> contenido,
    String actividadId,
    String productoId,
    bool activado,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      margin: EdgeInsets.only(bottom: 20),
      child: DivineCard(
        height: 180.0,
        color: color,
        shadowColor: Colors.black38,
        blurRadius: 12.0,
        img: 'assets/img/' + icono,
        imgHeight: 180.0,
        imgWidth: 180.0,
        buttonText: 'Ver más',
        buttonColor: Colors.white,
        buttonBackground: subColor,
        icon: EvaIcons.arrowForward,
        iconColor: Colors.white,
        title: accion[0].toUpperCase() + accion.substring(1).toLowerCase(),
        subtitle: nombreProducto[0].toUpperCase() +
            nombreProducto.substring(1).toLowerCase(),
        fontSize: 24.0,
        fontColor: Colors.white,
        tabsFix: tabsFix,
        contenidoConstante: ActivityProductPage(
          estadoEvento: siSembrar,
          refreshEvent: refresh,
          nombreProducto: nombreProducto,
          subtitulo: subtitulo,
          contenido: contenido,
          colorPage: color,
          actividadId: actividadId,
          productoId: productoId,
          nombreActividad: accion,
        ),
        activado: activado,
      ),
    );
  }

  Future<List<Widget>> obtenerActividades() async {
    List<Widget> listBody = [];
    List<Map<String, dynamic>> allProducts = widget.allProducts['plantas'];
    Set<String> idActivatesProducts = widget.idActivatesProducts.toSet();

    listBody.addAll([
      Container(
        padding: EdgeInsets.only(
          left: 30,
          right: 30,
          bottom: 20,
        ),
        child: Text(
          'Mis\nActividades',
          style: TextStyle(
            fontSize: 38,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ]);

    List<Widget> actividadesDiarias = [];
    List<Widget> actividadesIniciales = [];
    List<Widget> actividadesInicialesTerminadas = [];
    List<Widget> actividadesDiariasTerminadas = [];
    for (int i = 0; i < allProducts.length; i++) {
      var producto = allProducts[i];
      String nombreProducto = producto['nombre'];
      if (producto['activo'] == true) {
        String idProducto = producto['planta_id'];
        if (idActivatesProducts.contains(idProducto)) {
          List<Map<String, dynamic>> actividades = producto['actividades'];

          for (int j = 0; j < actividades.length; j++) {
            var actividad = actividades[j];
            String accion = actividad['titulo'];
            String subtitulo = actividad['subtitulo'];
            bool esActividadDiaria = actividad['actividad_diaria'];
            String idActividad = actividad['actividad_id'];
            List<Map<String, dynamic>> contenido = actividad['contenido'];
            var db = UserActivitiesProvider();
            await db.open(actividadesDBNAME);
            Map obtenerEstadoDeActividad = await db.getActivityState(
              idActividad: idActividad,
            );
            bool actividadTerminada;
            if (!esActividadDiaria &&
                obtenerEstadoDeActividad['cantidad'] == 1) {
              actividadTerminada = true;
            } else {
              actividadTerminada = obtenerEstadoDeActividad['fechaigual'];
            }

            await db.close();
            if (esActividadDiaria) {
              var carta = activityCard(
                accion: accion,
                nombreProducto: nombreProducto,
                icono: actividad['icon_name'],
                color: Color(0xFF5F283D),
                subColor: Color(0xff734355),
                subtitulo: subtitulo,
                contenido: contenido,
                productoId: idProducto,
                actividadId: idActividad,
                activado: actividadTerminada,
              );
              if (actividadTerminada)
                actividadesDiariasTerminadas.add(carta);
              else
                actividadesDiarias.add(carta);
            } else {
              var carta = activityCard(
                accion: accion,
                nombreProducto: nombreProducto,
                icono: actividad['icon_name'],
                color: Color(0xFF003d64),
                subColor: Color(0xff03568c),
                subtitulo: subtitulo,
                contenido: contenido,
                productoId: idProducto,
                actividadId: idActividad,
                activado: actividadTerminada,
              );
              if (actividadTerminada) {
                actividadesInicialesTerminadas.add(carta);
              } else {
                actividadesIniciales.add(carta);
              }
            }
          }
        }
      }
    }

    if (actividadesIniciales.length > 0)
      listBody.add(ProductsDivider(label: 'Actividades iniciales'));
    listBody.addAll(actividadesIniciales);
    if (actividadesDiarias.length > 0)
      listBody.add(ProductsDivider(label: 'Actividades diarias'));
    listBody.addAll(actividadesDiarias);
    if (actividadesDiariasTerminadas.length > 0)
      listBody.add(ProductsDivider(label: 'Diarias finalizadas'));
    listBody.addAll(actividadesDiariasTerminadas);
    if (actividadesInicialesTerminadas.length > 0)
      listBody.add(ProductsDivider(label: 'Iniciales finalizadas'));
    listBody.addAll(actividadesInicialesTerminadas);

    return listBody;
  }

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
                  NavigationButton(
                    icon: Icons.menu,
                    action: () {},
                    barckgroundColor: Color(0xfff7f8f9),
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  NavigationButton(
                    action: () async {
                      setState(() {});
                      // var x = await getCompleteActivities();
                      // print(x);
                      // var db = UserActivitiesProvider();
                      // await db.open(actividadesDBNAME);
                      // await db.getActivityState(
                      //   idActividad: 'act1',
                      // );
                    },
                    barckgroundColor: Color(0xff03568c),
                  ),
                ],
              ),
            ),
          ),
          brightness: Brightness.light,
        ),
        body: (widget.allProducts == null || widget.allProducts.isEmpty)
            ? EmptyProductsPage()
            : FutureBuilder(
                future: obtenerActividades(),
                builder:
                    (BuildContext c, AsyncSnapshot<List<Widget>> snapshot) {
                  if (snapshot.hasData) {
                    return SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.only(top: 40, bottom: 80),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: snapshot.data,
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }));
  }
}

class EmptyProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
        ),
        Text(
          'Oops!...',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Nunito',
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Image(
          image: Svg('assets/img/abrir-caja.svg'),
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: 30,
        ),
        SizedBox(
          width: 300,
          child: Text(
            'Sin eventos, activa por lo menos un producto',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Nunito',
            ),
          ),
        ),
        SizedBox(
          height: 24,
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text(
            'Ver productos',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'montserrat',
              fontWeight: FontWeight.w500,
            ),
          ),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                35,
              ),
            ),
            elevation: 0,
            primary: Colors.blue,
            padding: EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 30,
            ),
          ),
        ),
      ],
    );
  }
}
