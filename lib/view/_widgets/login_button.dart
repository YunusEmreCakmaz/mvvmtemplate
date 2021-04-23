import 'package:flutter/material.dart';
import 'package:mvvmtemplate/core/components/button/icon_normal_button.dart';

class MVVMLoginButton extends StatelessWidget {
  final Function(String data) onComplete;

  MVVMLoginButton({Key key, this.onComplete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconNormalButton(
      icon: Icons.access_alarm,
      onPressed: () {
        onComplete("OK");
      },
    );
  }
}
