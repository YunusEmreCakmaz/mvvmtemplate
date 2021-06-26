import 'package:flutter/material.dart';

import 'normal_button.dart';

class IconNormalButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const IconNormalButton({Key key, @required this.icon, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NormalButton(
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
