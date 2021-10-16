import 'package:flutter/material.dart';

import '../constants/border/border_radii.dart';

class ButtonStyles {
  const ButtonStyles(this.context);
  final BuildContext context;

  ButtonStyle roundedStyle({
    Color? backgroundColor,
    Color? borderColor,
    BorderRadius? borderRadius,
    EdgeInsets? padding,
    double? borderWidth,
    double? width,
    double? height,
  }) =>
      ButtonStyle(
        padding: _all<EdgeInsets?>(padding),
        backgroundColor: _all<Color>(backgroundColor ?? Colors.white),
        fixedSize:
            _all<Size>(Size(width ?? double.maxFinite, _maxHeight(height))),
        minimumSize: _all<Size>(Size.zero),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: _all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadii.mediumCircular,
            side: BorderSide(
              color: borderColor ?? Theme.of(context).primaryColor,
              width: borderWidth ?? 2.0,
            ),
          ),
        ),
      );

  double _maxHeight(double? height) {
    if (height == null) return double.maxFinite;
    return height > 36 ? height : 36;
  }

  MaterialStateProperty<T> _all<T>(T value) => MaterialStateProperty.all(value);
}
