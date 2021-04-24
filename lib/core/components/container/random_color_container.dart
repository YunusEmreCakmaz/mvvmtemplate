import 'package:flutter/material.dart';

import '../../extension/context_extension.dart';

class RandomColorContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.randomColor,
    );
  }
}
