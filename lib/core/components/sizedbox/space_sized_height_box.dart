import 'package:flutter/material.dart';

import '../../extension/context_extension.dart';

class SpaceSizedHeightBox extends StatelessWidget {
  final double height;

  const SpaceSizedHeightBox({Key key, this.height})
      : assert(height > 0 && height <= 1),
        super(key: key);
  @override
  Widget build(BuildContext context) =>
      SizedBox(height: context.height * height);
}
