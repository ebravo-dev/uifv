import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:ui2/widgets/divine_card.dart';
import 'package:ui2/widgets/products_divider.dart';

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
    print(widget.eventsFlag);
    return widget.eventsFlag ? EventsPage() : EmptyProductsPage();
  }
}

class EventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 100,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: 30,
                right: 30,
                bottom: 20,
              ),
              child: Text(
                'Mis\nActividades',
                style: TextStyle(
                  fontSize: 36,
                  // fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            ProductsDivider(
              label: 'Actividades Iniciales',
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: DivineCard(
                height: 180.0,
                color: Color(0xFF003d64),
                shadowColor: Colors.black38,
                blurRadius: 12.0,
                img: 'assets/img/maceta.svg',
                imgHeight: 180.0,
                imgWidth: 180.0,
                buttonText: 'Ver más',
                buttonColor: Colors.white,
                buttonBackground: Color(0xff03568c),
                icon: EvaIcons.arrowForward,
                iconColor: Colors.white,
                title: 'Sembrar',
                subtitle: 'Girasol',
                fontSize: 28.0,
                fontColor: Colors.white,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ProductsDivider(
              label: 'Actividades Diarias',
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: DivineCard(
                height: 180.0,
                color: Color(0xFF5F283D),
                shadowColor: Colors.black38,
                blurRadius: 12.0,
                img: 'assets/img/dom.svg',
                imgHeight: 180.0,
                imgWidth: 180.0,
                buttonText: 'Ver más',
                buttonColor: Colors.white,
                buttonBackground: Color(0xff734355),
                icon: EvaIcons.arrowForward,
                iconColor: Colors.white,
                title: 'Solear',
                subtitle: 'Girasol',
                fontSize: 28.0,
                fontColor: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: DivineCard(
                height: 180.0,
                color: Color(0xFF5F283D),
                shadowColor: Colors.black38,
                blurRadius: 12.0,
                img: 'assets/img/planta.svg',
                imgHeight: 180.0,
                imgWidth: 180.0,
                buttonText: 'Ver más',
                buttonColor: Colors.white,
                buttonBackground: Color(0xff734355),
                icon: EvaIcons.arrowForward,
                iconColor: Colors.white,
                title: 'Regar',
                subtitle: 'Girasol',
                fontSize: 28.0,
                fontColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EmptyProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
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
                fontFamily: 'montserrat',
                fontWeight: FontWeight.w400,
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
    ));
  }
}
