import 'dart:ui';

import 'package:flutter/material.dart';

abstract class AppColors {
  static const bgColor = Color(0xffd7d7d7);
  static const white = Color(0xffffffff);
  static const iconTextContentColor = Color(0xff0482ac);
  static const shadowColor = Color(0x200482ac);
  static const floatingActionButtonBg = Color(0xff007BC1);
  static const iconFavoriteBgColor = Color(0x80808080);
  static const gray = Color(0xFF808080);
  static const textBgColor = Color(0xff005F01);
  static const textColor = Color(0xff000000);
  static const textPriceBgColor = Color(0xffBFDFEA);
  static const sliderBarActiveColor = Color(0xff007fad);
  static const bottomSheetLabelTextColor = Color(0xff37454d);
  static const starColor = Color(0xfff6ab3f);
  static const showResultColor = Color(0xff007bc1);

  static const bottomSheetRatingColors = (
    rate0: Color(0xffdb3734),
    rate7: Color(0xfffc9e15),
    rate75: Color(0xff62a30f),
    rate8: Color(0xff028000),
    rate85: Color(0xff005f00),
  );
}

const MaterialColor primaryBlack = MaterialColor(
  _blackPrimaryValue,
  <int, Color>{
    50: Color(0xFF000000),
    100: Color(0xFF000000),
    200: Color(0xFF000000),
    300: Color(0xFF000000),
    400: Color(0xFF000000),
    500: Color(_blackPrimaryValue),
    600: Color(0xFF000000),
    700: Color(0xFF000000),
    800: Color(0xFF000000),
    900: Color(0xFF000000),
  },
);
const int _blackPrimaryValue = 0xFF000000;
