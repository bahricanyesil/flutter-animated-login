import 'package:flutter/material.dart';

import '../../decorations/text_styles.dart';

/// Base text with custom parameters
/// Wraps [Text] with [FittedBox], and implements some stylings.
class BaseText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign textAlign;
  final Color? color;
  final BoxFit? fit;
  const BaseText(
    this.text, {
    this.style,
    this.textAlign = TextAlign.center,
    this.color,
    this.fit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FittedBox(
        fit: fit ?? BoxFit.scaleDown,
        child: Text(
          text,
          style: TextStyles(context).normalStyle(color: color).merge(style),
          textAlign: textAlign,
          overflow: TextOverflow.clip,
        ),
      );
}
