import 'package:flutter/material.dart';

import '../../decorations/text_styles.dart';

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
          style: TextStyles(context).normalStyle().merge(style),
          textAlign: textAlign,
          overflow: TextOverflow.clip,
        ),
      );
}
