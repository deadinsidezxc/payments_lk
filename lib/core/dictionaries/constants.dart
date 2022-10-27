import 'dart:ui';

import 'package:flutter/material.dart';

class AppConstants{
 static const Map<int, Color> RED = {
    50:Color.fromRGBO(239,55,62, .1),
    100:Color.fromRGBO(239,55,62, .2),
    200:Color.fromRGBO(239,55,62, .3),
    300:Color.fromRGBO(239,55,62, .4),
    400:Color.fromRGBO(239,55,62, .5),
    500:Color.fromRGBO(239,55,62, .6),
    600:Color.fromRGBO(239,55,62, .7),
    700:Color.fromRGBO(239,55,62, .8),
    800:Color.fromRGBO(239,55,62, .9),
    900:Color.fromRGBO(239,55,62, 1),
  };
  static MaterialColor CUSTOMRED = MaterialColor(0xEF373E, RED);
}