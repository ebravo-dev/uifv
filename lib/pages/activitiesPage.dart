import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class ActivitiesPage extends StatefulWidget {
  final bool eventsFlag;

  const ActivitiesPage({Key key, @required this.eventsFlag}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ActivitiesPageState();
  }
}

class ActivitiesPageState extends State<ActivitiesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EmptyProductsPage(),
    );
  }
}

class EmptyProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
      ),
    );
  }
}
