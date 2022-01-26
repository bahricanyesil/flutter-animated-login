import 'package:flutter/material.dart';

import '../../decorations/text_styles.dart';

/// Base text with custom parameters but not wrapped with [FittedBox].
class NotFittedText extends StatelessWidget {
  /// This is the difference from the "BaseText", it also allows multline texts.
  /// Implements some further customizations.
  const NotFittedText(
    this.text, {
    this.style,
    this.textAlign = TextAlign.center,
    this.maxLines,
    Key? key,
  }) : super(key: key);

  /// Text itself.
  final String text;

  /// Style of the [text].
  final TextStyle? style;

  /// Alignment of the [text].
  final TextAlign textAlign;

  /// Int
  final int? maxLines;

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: TextStyles(context).normalStyle().merge(style),
        textAlign: textAlign,
        overflow: TextOverflow.clip,
        maxLines: maxLines,
      );
}
