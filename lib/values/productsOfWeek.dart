import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:ui2/values/const.dart';

final carrot = {
  "name": "Zanahoria",
  "image": Image(
    image: Svg('assets/img/carrot.svg'),
    fit: BoxFit.cover,
  ),
  "description": carrotDescription,
  "isActive": false,
};

final avocado = {
  "name": "Aguacate",
  "image": Image(
    image: Svg('assets/img/avocado.svg'),
    fit: BoxFit.cover,
  ),
  "description": avocadoDescription,
  "isActive": false,
};

final chili = {
  "name": "Chile Serrano",
  "image": Image(
    image: Svg('assets/img/chili.svg'),
    fit: BoxFit.cover,
  ),
  "description": serranoChiliDescription,
  "isActive": true,
};

final sunFlower = {
  "name": "Girasol",
  "image": Image(
    image: Svg('assets/img/girasol.svg'),
    fit: BoxFit.cover,
  ),
  "description": sunFlowerDescription,
  "isActive": true,
};

final strawberry = {
  "name": "Fresa",
  "image": Image(
    image: Svg('assets/img/fresa.svg'),
    fit: BoxFit.cover,
  ),
  "description": strawberryDescription,
  "isActive": false,
};

final egg = {
  "name": "Huevo",
  "image": Image(
    image: Svg('assets/img/egg.svg'),
    fit: BoxFit.cover,
  ),
  "description": eggDescription,
  "isActive": false,
};

final lettuce = {
  "name": "Lechuga",
  "image": Image(
    image: Svg('assets/img/lettuce.svg'),
    fit: BoxFit.cover,
  ),
  "description": lettuceDescription,
  "isActive": false,
};

final tomatoes = {
  "name": "Tomates",
  "image": Image(
    image: Svg('assets/img/tomato.svg'),
    fit: BoxFit.cover,
  ),
  "description": tomatoesDescription,
  "isActive": false,
};

final garlic = {
  "name": "Ajo",
  "image": Image(
    fit: BoxFit.cover,
    image: Svg(
      'assets/img/garlic.svg',
    ),
  ),
  "description": garlicDescription,
  "isActive": false,
};
