import 'package:flutter/material.dart';
import 'package:ui2/values/colors.dart';
import 'package:ui2/widgets/navigation_button.dart';

class SplashProductPage extends StatelessWidget {
  final Widget imageHero;
  final String productName;
  final String productDescription;

  const SplashProductPage(
      {Key key, this.imageHero, this.productName, this.productDescription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 800)).whenComplete(() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) {
        return ViewProductPage(
          imageHero: imageHero,
          productName: productName,
          productDescription: productDescription,
        );
      }));
    });
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Hero(
            tag: productName,
            child: Container(
              width: 144,
              height: 144,
              child: imageHero,
            ),
          ),
        ),
      ),
    );
  }
}

class ViewProductPage extends StatefulWidget {
  final Widget imageHero;
  final String productName;
  final String productDescription;

  const ViewProductPage(
      {Key key, this.imageHero, this.productName, this.productDescription})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ViewProductPageState();
  }
}

class ViewProductPageState extends State<ViewProductPage> {
  bool estado = true;

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 500)).whenComplete(() {
      if (mounted)
        setState(() {
          estado = false;
        });
    });
    return WillPopScope(
      onWillPop: () async => !estado,
      child: Scaffold(
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
                  AnimatedOpacity(
                    opacity: estado ? 0 : 1,
                    duration: Duration(milliseconds: 500),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {},
                      color: loginSplashColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          brightness: Brightness.light,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 40),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: widget.productName,
                child: Container(
                  width: 144,
                  height: 144,
                  child: widget.imageHero,
                ),
              ),
              SizedBox(
                height: 80,
              ),
              AnimatedOpacity(
                opacity: estado ? 0 : 1,
                duration: Duration(milliseconds: 500),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Beneficios',
                        style: TextStyle(
                          fontSize: 24,
                          color: loginSplashColor,
                          fontWeight: FontWeight.w500,
                          // fontFamily: 'Nunito',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.productDescription,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: AnimatedOpacity(
          opacity: estado ? 0 : 1,
          duration: Duration(milliseconds: 500),
          child: Container(
            margin: EdgeInsets.only(left: 33, bottom: 10, top: 10),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      primary: loginSplashColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                    ),
                    child: Text(
                      'Agregar',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
