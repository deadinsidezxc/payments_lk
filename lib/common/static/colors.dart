import 'package:flutter/material.dart';

class AppColors {
  static const primaryBackground = Color.fromRGBO(239, 239, 239, 1);
  static const primary = Color.fromRGBO(239, 55, 62, 1);
  static const error = Color.fromRGBO(244, 126, 40, 1);
  static const authTextFieldText = Color.fromRGBO(177, 178, 178, 1);
  static const authPincode = Color.fromRGBO(75, 78, 81, 1);
  static const primaryBackgroundContracts = Color.fromRGBO(245, 245, 245, 1);
  static const darkGrey = Color.fromRGBO(75, 78, 81, 1);
  static const lightDarkGrey = Color.fromRGBO(178, 178, 178, 1);
  static const grey = Color.fromRGBO(199, 201, 200, 1);
  static const darkGreen = Color.fromRGBO(99, 142, 88, 1);

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
