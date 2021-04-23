import 'package:flutter/material.dart';
import 'package:mvvmtemplate/core/components/button/normal_button.dart';

class TitleTextButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  TitleTextButton({Key key, this.title, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NormalButton(
      child: Text(title),
      onPressed: onPressed,
    );
  }
}
