import 'package:flutter/material.dart';

import '../../decorations/text_styles.dart';

class BaseText extends StatelessWidget {
  /// Base text with custom parameters
  /// Wraps [Text] with [FittedBox], and implements some stylings.
  const BaseText(
    this.text, {
    this.style,
    this.textAlign = TextAlign.center,
    this.color,
    this.fit,
    this.forceDefaultStyle = false,
    Key? key,
  }) : super(key: key);
  final String text;
  final TextStyle? style;
  final TextAlign textAlign;
  final Color? color;
  final BoxFit? fit;
  final bool forceDefaultStyle;

  @override
  Widget build(BuildContext context) => FittedBox(
        fit: fit ?? BoxFit.scaleDown,
        child: Text(
          text,
          style: forceDefaultStyle
              ? style
              : TextStyles(context).normalStyle(color: color).merge(style),
          textAlign: textAlign,
          overflow: TextOverflow.clip,
        ),
      );
}
