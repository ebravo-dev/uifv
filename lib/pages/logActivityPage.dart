import 'package:flutter/material.dart';
import 'package:ui2/databases/UserActivities.dart';
import 'package:ui2/databases/nameDb.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class LogActivityPage extends StatefulWidget {
  final Map<String, dynamic> allProducts;
  final List<String> idActivatesProducts;

  const LogActivityPage({Key key, this.allProducts, this.idActivatesProducts})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LogActivityPageState();
  }
}

class LogActivityPageState extends State<LogActivityPage> {
  String dropValue = 'Todos';
  int currentPage = 0;
  ScrollController controller;
  var db = UserActivitiesProvider();
  bool flagScroll = true;
  List<Widget> listBody = [];

  @override
  void initState() {
    super.initState();
    controller = new ScrollController()..addListener(_scrollListener);
  }

  void _scrollListener() {
    if (controller.position.extentAfter == 0) {
      if (mounted && flagScroll)
        setState(() {
          currentPage++;
          print(';¨>>>>' + currentPage.toString());
          flagScroll = false;
        });
    }
  }

  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    db.close();
    super.dispose();
  }

  Future<List<Map>> getActivitiesFromDb() async {
    await db.open(actividadesDBNAME);
    var actividades = await db.getActivities(
      productosActivos: widget.idActivatesProducts,
      limit: 20,
      page: currentPage,
    );

    return actividades;
  }

  Future<List<Widget>> getActivities() async {
    await Future.delayed(Duration(milliseconds: 1500));
    var actividades = await getActivitiesFromDb();

    listBody.addAll(actividades
        .map(
          (e) => Container(
            padding: EdgeInsets.all(30),
            child: Text(
              e['producto_id'] + ' -> ' + e['fecha'],
            ),
          ),
        )
        .toList());

    print('********> ' + listBody.length.toString());
    flagScroll = true;
    return listBody;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getActivities(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Widget>> asyncSnapshot) {
          if (asyncSnapshot.hasData) {
            return ListView.builder(
              controller: controller,
              itemCount: asyncSnapshot.data.length,
              itemBuilder: (c, i) {
                return asyncSnapshot.data[i];
              },
            );
          } else {
            var items = [];
            items.add(Text('hola'));
            return listBody.length == 0
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView(
                    children: items,
                  );
          }
        },
      ),
    );
  }
}
