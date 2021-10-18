import 'package:flutter/material.dart';

import '../../responsiveness/dynamic_size.dart';

class BaseIcon extends StatelessWidget {
  final IconData iconData;
  final double widthFactor;
  final Color? color;
  final EdgeInsets? padding;
  const BaseIcon(
    this.iconData, {
    required this.widthFactor,
    this.color,
    this.padding,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DynamicSize dynamicSize = DynamicSize(context);
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Padding(
        padding: _getPadding(context, dynamicSize),
        child: Icon(iconData,
            size: dynamicSize.fontSize * widthFactor, color: color),
      ),
    );
  }

  EdgeInsets _getPadding(BuildContext context, DynamicSize dynamicSize) =>
      padding ?? EdgeInsets.symmetric(horizontal: dynamicSize.width * .8);
}
