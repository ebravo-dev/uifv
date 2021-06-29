import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gps/gps.dart';
import 'package:ui2/widgets/product_item_maps.dart';

// class MapaPage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return MapaPageState();
//   }
// }

class MapaPage extends StatelessWidget {
  // final List<String> lugares = [
  //   'AGUASCALIENTES',
  //   'BAJA CALIFORNIA',
  //   'BAJA CALIFORNIA SUR',
  //   'CAMPECHE',
  //   'COAHUILA',
  //   'COLIMA',
  //   'CHIAPAS',
  //   'CHIHUAHUA',
  //   'CIUDAD DE MEXICO',
  //   'DURANGO',
  //   'GUANAJUATO',
  //   'GUERRERO',
  //   'HIDALGO',
  //   'JALISCO',
  //   'ESTADO DE MEXICO',
  //   'MICHOACAN',
  //   'MORELOS',
  //   'NAYARIT',
  //   'NUEVO LEON',
  //   'OAXACA',
  //   'PUEBLA',
  //   'QUERETARO',
  //   'QUINTANA ROO',
  //   'SAN LUIS POTOSI',
  //   'SINALOA',
  //   'SONORA',
  //   'TABASCO',
  //   'TAMAULIPAS',
  //   'TLAXCALA',
  //   'VERACRUZ',
  //   'YUCATAN',
  //   'ZACATECAS'
  // ];

  Future<String> porcord(double lat, double long) async {
    // var latlng = await Gps.currentGps();
    final coordinates = new Coordinates(lat, long);
    await Future.delayed(Duration(milliseconds: 500));
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    return first.adminArea;
  }

  Future<CameraPosition> getCurrentPosition() async {
    var latlng = await Gps.currentGps();
    String estado =
        await porcord(double.parse(latlng.lat), double.parse(latlng.lng));
    return CameraPosition(
      target: LatLng(
        double.parse(latlng.lat),
        double.parse(latlng.lng),
      ),
      zoom: 16,
    );
  }

  @override
  Widget build(BuildContext context) {
    Completer<GoogleMapController> _controller = Completer();
    return FutureBuilder(
      future: getCurrentPosition(),
      builder: (BuildContext c, AsyncSnapshot<CameraPosition> asyncSnapshot) {
        if (asyncSnapshot.hasData) {
          return Scaffold(
            // appBar: AppBar(
            //   backgroundColor: Colors.transparent,
            //   elevation: 0.0,
            //   brightness: Brightness.light,
            // ),
            extendBodyBehindAppBar: true,
            body: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: asyncSnapshot.data,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              markers: {
                Marker(
                    markerId: MarkerId('me'),
                    position: asyncSnapshot.data.target),
              },
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniEndTop,
            floatingActionButton: FloatingActionButton(
              // elevation: 0,
              mini: true,
              backgroundColor: Colors.white,
              child: Text(
                'i',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'montserrat',
                    color: Colors.black),
              ),
              onPressed: () {
                showCupertinoDialog(
                    context: context,
                    builder: (c) {
                      return AlertDialog(
                        title: Text('Acerca del GPS'),
                        content: Text(
                            'Se muestran los productos asociados a tu ubicación, se basa del estudio de la actividad de los productos con la entidad federativa.'),
                      );
                    });
              },
            ),
            bottomSheet: Container(
              padding: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black38,
                      offset: Offset(0.0, 10.0),
                      blurRadius: 12)
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                  ),
                  Text(
                    'Productos según tu ubicación',
                    style: TextStyle(
                      // fontFamily: 'montserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.only(
                        // left: 15,
                        ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        3,
                        (index) => ProductItemMap(
                          imageUrl:
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdSI_I190gm5-zzj6MEF_6e0HWJ4CZZvs6Tg&usqp=CAU',
                          onTap: () {},
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              brightness: Brightness.light,
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

class EmptyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
    );
  }

  @override
  Size get preferredSize => Size(0.0, 0.0);
}
