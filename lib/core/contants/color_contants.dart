import 'package:flutter/material.dart';

class ColorConstants {
  static ColorConstants? _instace;
  static ColorConstants get instance {
    _instace ??= ColorConstants._init();
    return _instace!;
  }

  ColorConstants._init();

  static const appBarColor = Color(0xFFB71C1C);
}
