import 'package:flutter/material.dart';
import 'package:mvvmtemplate/core/extension/context_extension.dart';

class IndicatorListView extends StatelessWidget {
  final int itemCount;
  final int currentIndex;
  final Widget Function(int index) onListItem;

  IndicatorListView(
      {Key key, this.itemCount, this.currentIndex, this.onListItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: itemCount,
      itemBuilder: (context, index) => buildPadding(context, index),
      shrinkWrap: true,
    );
  }

  Padding buildPadding(BuildContext context, int index) {
    return Padding(
      padding: context.paddingLow,
      child: buildCircleAvatar(index, context),
    );
  }

  CircleAvatar buildCircleAvatar(int index, BuildContext context) {
    return CircleAvatar(
      backgroundColor: isCurrentIndex(index) ? Colors.black12 : Colors.blue,
      radius:
          isCurrentIndex(index) ? context.width * 0.03 : context.width * 0.015,
      child: AnimatedOpacity(
        opacity: opacityValue(index),
        duration: context.durationNormal,
        child: onListItem(index),
      ),
    );
  }

  double opacityValue(int index) => isCurrentIndex(index) ? 1 : 0;

  bool isCurrentIndex(int index) => currentIndex == index;
}
