import 'package:flutter/material.dart';
import 'package:ui2/values/colors.dart';
import 'package:ui2/widgets/description_item.dart';

class SplashProductPage extends StatelessWidget {
  final Widget imageHero;
  final String productName;
  final Map<String, dynamic> productDescription;

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
  final Map<String, dynamic> productDescription;

  const ViewProductPage(
      {Key key, this.imageHero, this.productName, this.productDescription})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ViewProductPageState();
  }
}

class ViewProductPageState extends State<ViewProductPage> {
  final List<Widget> descriptionWidgets = [];
  bool initWaitFlag = true;

  @override
  void initState() {
    final Map<String, dynamic> productDescription = widget.productDescription;
    productDescription.forEach(
      (key, value) => descriptionWidgets.add(
        DescriptionItem(
          header: key,
          description: value,
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 500)).whenComplete(() {
      if (mounted)
        setState(() {
          initWaitFlag = false;
        });
    });
    return WillPopScope(
      onWillPop: () async => !initWaitFlag,
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
                    opacity: initWaitFlag ? 0 : 1,
                    duration: Duration(milliseconds: 500),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        if (!initWaitFlag) Navigator.pop(context);
                      },
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
                opacity: initWaitFlag ? 0 : 1,
                duration: Duration(milliseconds: 500),
                child: Container(
                  padding: EdgeInsets.only(right: 50, left: 50, bottom: 60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: descriptionWidgets,
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: AnimatedOpacity(
          opacity: initWaitFlag ? 0 : 1,
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
                      'Activar',
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
