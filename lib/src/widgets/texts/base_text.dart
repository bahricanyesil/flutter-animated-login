import 'package:flutter/material.dart';

import '../../decorations/text_styles.dart';

/// Base text with custom parameters
class BaseText extends StatelessWidget {
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

  /// Text itself.
  final String text;

  /// Style of the [text].
  final TextStyle? style;

  /// Alignment of the [text].
  final TextAlign textAlign;

  /// Color of the [text].
  final Color? color;

  /// Custom [BoxFit] option.
  final BoxFit? fit;

  /// Bool to determine whether to force the default style.
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
