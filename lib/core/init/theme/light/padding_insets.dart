import 'package:flutter/material.dart';

class PaddingInsets {
  static PaddingInsets _instance;
  static PaddingInsets get instance {
    if (_instance == null) _instance = PaddingInsets._init();
    return _instance;
  }

  PaddingInsets._init();

  final lowPaddingAll = EdgeInsets.all(5);
}
