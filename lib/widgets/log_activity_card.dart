import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LogActivityCard extends StatelessWidget {
  final String urlImage;
  final String dateTime;
  final String productName;
  final String activityName;

  const LogActivityCard(
      {Key key,
      this.urlImage,
      this.dateTime,
      this.productName,
      this.activityName})
      : super(key: key);

  String getMonthName(int month) {
    switch (month) {
      case 1:
        return "Ene";

      case 2:
        return "Feb";

      case 3:
        return "Mar";

      case 4:
        return "Abr";

      case 5:
        return "May";

      case 6:
        return "Jun";

      case 7:
        return "Jul";

      case 8:
        return "Ago";

      case 9:
        return "Sep";

      case 10:
        return "Oct";

      case 11:
        return "Nov";

      case 12:
        return "Dic";
      default:
        return '';
    }
  }

  Widget cartaActividad() {
    DateTime date = DateTime.parse(dateTime);

    String resDate = date.day.toString() +
        ' ' +
        getMonthName(date.month) +
        ' ' +
        date.year.toString() +
        ', ' +
        DateFormat.Hm().format(date) +
        ' ' +
        DateFormat('a').format(date);
    return Container(
      margin: EdgeInsets.only(
        bottom: 30,
        right: 40,
        left: 40,
      ),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Color(0xFF5F283D),
        borderRadius: BorderRadius.circular(25.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0.0, 8.0),
            blurRadius: 16.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            margin: EdgeInsets.only(
              top: 22,
            ),
            child: Text(
              'Fecha de actividad',
              style: TextStyle(
                color: Colors.white60,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 25,
            ),
            margin: EdgeInsets.only(
              bottom: 20,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.access_time_filled,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Text(
                    resDate,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 25,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        width: 60,
                        height: 60,
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: urlImage,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  CupertinoActivityIndicator(),
                          errorWidget: (context, url, dynamic error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productName[0].toUpperCase() +
                                productName.substring(1).toLowerCase(),
                            style: TextStyle(
                              fontSize: 18,
                              // color: Colors.blueGrey.shade800,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Actividad | ' + activityName,
                            style: TextStyle(
                              fontSize: 16,
                              // color: Colors.blueGrey.shade800,
                              // fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return cartaActividad();
  }
}
