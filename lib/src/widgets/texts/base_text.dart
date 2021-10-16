import 'package:animated_login/src/decorations/text_styles.dart';
import 'package:flutter/material.dart';

class BaseText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign textAlign;
  final Color? color;
  const BaseText(
    this.text, {
    this.style,
    this.textAlign = TextAlign.center,
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          text,
          style: _defaultStyle(context),
          textAlign: textAlign,
          overflow: TextOverflow.clip,
        ),
      );

  TextStyle _defaultStyle(BuildContext context) =>
      TextStyles(context).normalStyle();
}
