import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

final carrot = {
  "name": "Zanahoria",
  "image": Transform.rotate(
    angle: -pi / 12,
    child: Image(
      width: 130,
      height: 130,
      image: Svg('assets/img/carrot.svg'),
    ),
  ),
  "color": Colors.indigo.shade300,
};

final avocado = {
  "name": "Aguacate",
  "image": Transform.rotate(
    angle: pi / 12,
    child: Image(
      width: 140,
      height: 140,
      image: Svg('assets/img/avocado.svg'),
    ),
  ),
  "color": Colors.indigo.shade300,
};

final chili = {
  "name": "Chile",
  "image": Transform.rotate(
    angle: -pi / 8,
    child: Image(
      width: 160,
      height: 160,
      image: Svg('assets/img/chili.svg'),
    ),
  ),
  "color": Colors.indigo.shade300,
};

final egg = {
  "name": "Huevo",
  "image": Transform.rotate(
    angle: -pi / 12,
    child: Image(
      width: 130,
      height: 130,
      image: Svg('assets/img/egg.svg'),
    ),
  ),
  "color": Colors.indigo.shade300,
};

final lettuce = {
  "name": "Lechuga",
  "image": Transform.rotate(
    angle: 0,
    child: Image(
      width: 130,
      height: 140,
      image: Svg('assets/img/lettuce.svg'),
    ),
  ),
  "color": Colors.indigo.shade300,
};

final tomatoes = {
  "name": "Tomates",
  "image": Transform.rotate(
    angle: 0,
    child: Image(
      width: 130,
      height: 150,
      image: Svg('assets/img/tomate.svg'),
    ),
  ),
  "color": Colors.indigo.shade300,
};

final garlic = {
  "name": "Ajo",
  "image": Transform.rotate(
    angle: 0,
    child: Image(
      width: 120,
      height: 150,
      image: Svg('assets/img/garlic.svg'),
    ),
  ),
  "color": Colors.indigo.shade300,
};
