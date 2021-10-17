import 'package:flutter/material.dart';

import '../../responsiveness/dynamic_size.dart';
import '../../utils/device_type_helper.dart';

class BaseIcon extends StatelessWidget {
  final IconData iconData;
  final double widthFactor;
  final bool highlight;
  final Color? color;
  final EdgeInsets? padding;
  const BaseIcon(
    this.iconData, {
    required this.widthFactor,
    this.highlight = false,
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
        child: Icon(
          iconData,
          size: dynamicSize.width *
              (highlight ? (widthFactor * 1.2) : widthFactor),
          color: _iconColor(context),
        ),
      ),
    );
  }

  EdgeInsets _getPadding(BuildContext context, DynamicSize dynamicSize) =>
      padding ?? EdgeInsets.symmetric(horizontal: dynamicSize.width * .8);

  Color? _iconColor(BuildContext context) =>
      color ?? (highlight ? Theme.of(context).primaryColor : null);
}
