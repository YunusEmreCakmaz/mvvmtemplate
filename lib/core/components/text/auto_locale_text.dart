import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mvvmtemplate/core/extension/string_extension.dart';

class AutoLocalText extends StatelessWidget {
  final String value;
  final TextAlign textAlign;
  final TextStyle style;

  AutoLocalText({Key key, @required this.value, this.textAlign, this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      value.locale,
      textAlign: textAlign,
      style: style,
    );
  }
}
