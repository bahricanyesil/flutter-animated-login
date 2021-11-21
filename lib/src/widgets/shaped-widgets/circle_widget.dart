import 'package:flutter/material.dart';

import '../../responsiveness/dynamic_size.dart';

class CircleWidget extends StatelessWidget {
  /// Provides a circle button with custom stylings.
  /// Shapes the button as circle with the given height/width.
  const CircleWidget({
    required this.child,
    this.widthFactor = 13,
    this.borderWidthFactor,
    this.onTap,
    this.color,
    this.hoverColor,
    this.border,
    Key? key,
  }) : super(key: key);
  final Widget child;
  final double widthFactor;
  final VoidCallback? onTap;
  final double? borderWidthFactor;
  final Color? color;
  final Color? hoverColor;
  final BorderSide? border;

  @override
  Widget build(BuildContext context) {
    final DynamicSize dynamicSize = DynamicSize(context);
    return SizedBox(
      width: dynamicSize.responsiveSize * widthFactor,
      height: dynamicSize.responsiveSize * widthFactor,
      child: RawMaterialButton(
        onPressed: onTap,
        hoverColor: hoverColor ??
            (color?.withOpacity(.7) ??
                Theme.of(context).primaryColorLight.withOpacity(.7)),
        shape: _buttonShape(context),
        padding: EdgeInsets.all(dynamicSize.responsiveSize * widthFactor / 4),
        elevation: 3,
        child: child,
      ),
    );
  }

  /// Returns the border style of the button.
  ShapeBorder _buttonShape(BuildContext context) => CircleBorder(
        side: border ??
            BorderSide(
              color: color ?? Colors.black54,
              width: DynamicSize(context).width * (borderWidthFactor ?? .2),
            ),
      );
}
