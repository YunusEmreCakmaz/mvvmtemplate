import 'package:flutter/material.dart';
import 'package:mvvmtemplate/core/components/button/normal_button.dart';

class IconNormalButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const IconNormalButton({Key key, @required this.icon, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NormalButton(
      child: Icon(icon),
      onPressed: onPressed,
    );
  }
}
