import 'package:flutter/material.dart';

class TextStyles {
  const TextStyles(this.context);
  final BuildContext context;

  TextStyle titleStyle({Color? color}) => TextStyle(
        fontSize: 50,
        color: color ?? Theme.of(context).primaryColor,
        fontWeight: FontWeight.bold,
        wordSpacing: 4,
        letterSpacing: 1.5,
      );

  TextStyle bodyStyle({Color? color}) => TextStyle(
        fontSize: 26,
        color: color ?? Colors.white.withOpacity(.8),
        fontWeight: FontWeight.w500,
        wordSpacing: 3,
        letterSpacing: 1.3,
      );

  TextStyle normalStyle({Color? color}) => TextStyle(
        fontSize: 26,
        color: color ?? Colors.white.withOpacity(.8),
        fontWeight: FontWeight.w500,
        wordSpacing: 3,
        letterSpacing: 1.3,
      );
}
