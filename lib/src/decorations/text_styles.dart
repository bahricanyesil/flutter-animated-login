import 'package:flutter/material.dart';

import '../responsiveness/dynamic_size.dart';

class TextStyles {
  TextStyles(this.context) {
    dynamicSize = DynamicSize(context);
  }
  final BuildContext context;
  late final DynamicSize dynamicSize;

  TextStyle titleStyle({Color? color}) => TextStyle(
        fontSize: dynamicSize.fontSize * 13,
        color: color ?? Theme.of(context).primaryColor,
        fontWeight: FontWeight.bold,
        wordSpacing: 4,
        letterSpacing: 1.5,
      );

  TextStyle bodyStyle({Color? color}) => TextStyle(
        fontSize: dynamicSize.fontSize * 6.8,
        color: color ?? Colors.white.withOpacity(.8),
        fontWeight: FontWeight.w500,
        wordSpacing: 3,
        letterSpacing: 1.3,
      );

  TextStyle subBodyStyle({Color? color, TextDecoration? decoration}) =>
      TextStyle(
        fontSize: dynamicSize.fontSize * 5.5,
        color: color ?? Colors.white.withOpacity(.8),
        fontWeight: FontWeight.w400,
        wordSpacing: 2.4,
        letterSpacing: 1.2,
        decoration: decoration,
      );

  TextStyle normalStyle({Color? color}) => TextStyle(
        fontSize: dynamicSize.fontSize * 10,
        color: color ?? Colors.white.withOpacity(.8),
        fontWeight: FontWeight.w500,
        wordSpacing: 3,
        letterSpacing: 1.3,
      );

  TextStyle textFormStyle({Color? color}) => TextStyle(
        fontSize: dynamicSize.fontSize * 5.2,
        color: color ?? Theme.of(context).primaryColor,
        fontWeight: FontWeight.w400,
        wordSpacing: 2.3,
        letterSpacing: 1.2,
      );

  TextStyle hintTextStyle({Color? color}) => TextStyle(
        fontSize: dynamicSize.fontSize * 5.2,
        color: color,
        fontWeight: FontWeight.w400,
        wordSpacing: 2.2,
        letterSpacing: 1.2,
      );

  TextStyle errorTextStyle({Color? color}) => TextStyle(
        fontSize: dynamicSize.fontSize * 3,
        color: color ?? Colors.red[400],
        wordSpacing: 1.5,
        height: .9,
      );

  TextStyle subtitleTextStyle({Color? color, TextDecoration? decoration}) =>
      TextStyle(
        fontSize: dynamicSize.fontSize * 5,
        color: color ?? Colors.white.withOpacity(.8),
        fontWeight: FontWeight.w400,
        decoration: decoration,
      );
}

extension Underline on TextStyle {
  TextStyle get underline => copyWith(
        shadows: <Shadow>[
          Shadow(
            color: color ?? Colors.white.withOpacity(.8),
            offset: const Offset(0, -5),
          )
        ],
        color: Colors.transparent,
        decoration: TextDecoration.underline,
        decorationColor: color ?? Colors.white.withOpacity(.8),
      );
}
