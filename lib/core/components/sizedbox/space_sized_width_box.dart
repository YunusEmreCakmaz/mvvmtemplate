import 'package:flutter/material.dart';

import '../../extension/context_extension.dart';

class SpaceSizedWidthBox extends StatelessWidget {
  final double width;

  const SpaceSizedWidthBox({Key key, this.width})
      : assert(width > 0 && width <= 1),
        super(key: key);
  @override
  Widget build(BuildContext context) => SizedBox(width: context.width * width);
}
