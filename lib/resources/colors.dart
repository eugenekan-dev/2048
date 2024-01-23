import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static const backgroundColor = Color(0xfffaf8ef);
  static const textColor = Color(0xff776e65);
  static const textColorWhite = Color(0xfff9f6f2);
  static const boardColor = Color(0xffbbada0);
  static const emptyTileColor = Color(0xffcdc1b4);
  static const buttonColor = Color(0xff8f7a66);
  static const scoreColor = Color(0xffbbada0);
  static const overlayColor = Color.fromRGBO(238, 228, 218, 0.73);

  static const color2 = Color(0xffeee4da);
  static const color4 = Color(0xffeee1c9);
  static const color8 = Color(0xfff3b27a);
  static const color16 = Color(0xfff69664);
  static const color32 = Color(0xfff77c5f);
  static const color64 = Color(0xfff75f3b);
  static const color128 = Color(0xffedd073);
  static const color256 = Color(0xffedcc62);
  static const color512 = Color(0xffedc950);
  static const color1024 = Color(0xffedc53f);
  static const color2048 = Color(0xffedc22e);

  static const borderRadius = BorderRadius.all(Radius.circular(4.0));

  static const tileColors = {
    2: color2,
    4: color4,
    8: color8,
    16: color16,
    32: color32,
    64: color64,
    128: color128,
    256: color256,
    512: color512,
    1024: color1024,
    2048: color2048,
  };
}
