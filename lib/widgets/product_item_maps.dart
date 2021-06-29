import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductItemMap extends StatelessWidget {
  final String imageUrl;
  final Function onTap;

  const ProductItemMap({Key key, this.imageUrl, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
          bottom: 30,
          left: 13,
          right: 13,
        ),
        width: 70,
        height: 70,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CupertinoActivityIndicator(),
                errorWidget: (context, url, dynamic error) =>
                    const Icon(Icons.error),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
