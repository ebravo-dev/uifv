import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gps/gps.dart';

class MapaPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MapaPageState();
  }
}

class MapaPageState extends State<MapaPage> {
  List<String> lugares = [
    'AGUASCALIENTES',
    'BAJA CALIFORNIA',
    'BAJA CALIFORNIA SUR',
    'CAMPECHE',
    'COAHUILA',
    'COLIMA',
    'CHIAPAS',
    'CHIHUAHUA',
    'CIUDAD DE MEXICO',
    'DURANGO',
    'GUANAJUATO',
    'GUERRERO',
    'HIDALGO',
    'JALISCO',
    'ESTADO DE MEXICO',
    'MICHOACAN',
    'MORELOS',
    'NAYARIT',
    'NUEVO LEON',
    'OAXACA',
    'PUEBLA',
    'QUERETARO',
    'QUINTANA ROO',
    'SAN LUIS POTOSI',
    'SINALOA',
    'SONORA',
    'TABASCO',
    'TAMAULIPAS',
    'TLAXCALA',
    'VERACRUZ',
    'YUCATAN',
    'ZACATECAS'
  ];

  Future<String> algo(String lugar) async {
    await Future.delayed(Duration(milliseconds: 500));
    var addresses = await Geocoder.local.findAddressesFromQuery(lugar);
    var first = addresses.first;
    return ("${first.coordinates} : ${first.adminArea}");
  }

  Future<String> porcord(double lat, double long) async {
    // var latlng = await Gps.currentGps();
    final coordinates = new Coordinates(lat, long);
    await Future.delayed(Duration(milliseconds: 500));
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    return ("${first.coordinates} : ${first.adminArea}");
  }

  int prueba = 0;

  Future<CameraPosition> getCurrentPosition() async {
    var latlng = await Gps.currentGps();
    prueba = 2;
    return CameraPosition(
      target: LatLng(
        double.parse(latlng.lat),
        double.parse(latlng.lng),
      ),
      zoom: 18,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Completer<GoogleMapController> _controller = Completer();
    return FutureBuilder(
      future: getCurrentPosition(),
      builder: (BuildContext c, AsyncSnapshot<CameraPosition> asyncSnapshot) {
        if (asyncSnapshot.hasData) {
          return Scaffold(
            body: GoogleMap(
              mapType: MapType.hybrid,
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
            floatingActionButton: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  prueba,
                  (index) => Container(
                    margin: EdgeInsets.only(
                      bottom: 20,
                      left: 20,
                    ),
                    width: 100,
                    height: 100,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
