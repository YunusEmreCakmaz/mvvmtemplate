import 'package:flutter/material.dart';

class ColorSchemeLight {
  static ColorSchemeLight _instance;
  static ColorSchemeLight get instance {
    if (_instance == null) _instance = ColorSchemeLight._init();
    return _instance;
  }

  ColorSchemeLight._init();

  final Color brown = Color(0xFF0A0604);
  final Color red = Color(0xffc10e0e);
  final Color white = Color(0xffffffff);
  final Color gray = Color(0xffa5a6ae);
  final Color lightGray = Color(0xfff7f7f7);
  final Color darkGray = Color(0xff676870);
  final Color black = Color(0xff020306);
  final Color azure = Color(0xff27928d);
}
