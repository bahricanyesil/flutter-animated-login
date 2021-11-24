import 'package:flutter/material.dart';

import '../../decorations/text_styles.dart';

class NotFittedText extends StatelessWidget {
  /// Base text with custom parameters but not wrapped with [FittedBox].
  /// This is the difference from the "BaseText", it also allows multline texts.
  /// Implements some further customizations.
  const NotFittedText(
    this.text, {
    this.style,
    this.textAlign = TextAlign.center,
    this.maxLines,
    Key? key,
  }) : super(key: key);
  final String text;
  final TextStyle? style;
  final TextAlign textAlign;
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
