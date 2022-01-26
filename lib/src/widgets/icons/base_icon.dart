import 'package:flutter/material.dart';

import '../../responsiveness/dynamic_size.dart';

/// Base icon with custom parameters
class BaseIcon extends StatelessWidget {
  /// Wraps [Icon] with [FittedBox], and gives some paddings.
  const BaseIcon(
    this.iconData, {
    this.sizeFactor,
    this.color,
    this.padding,
    Key? key,
  }) : super(key: key);

  /// Icon to display.
  final IconData iconData;

  /// Size factor for the icon.
  final double? sizeFactor;

  /// Color of the icon.
  final Color? color;

  /// Padding of the icon.
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final DynamicSize dynamicSize = DynamicSize(context);
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Padding(
        padding: _getPadding(context, dynamicSize),
        child: Icon(
          iconData,
          size: sizeFactor != null
              ? (dynamicSize.responsiveSize * sizeFactor!)
              : null,
          color: color,
        ),
      ),
    );
  }

  EdgeInsets _getPadding(BuildContext context, DynamicSize dynamicSize) =>
      padding ?? EdgeInsets.symmetric(horizontal: dynamicSize.width * .8);
}
