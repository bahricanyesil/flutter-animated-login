import 'package:flutter/material.dart';

import '../../decorations/text_styles.dart';

/// Base text with custom parameters but not wrapped with [FittedBox].
/// This is the difference from the "BaseText", it also allows multline texts.
/// Implements some further customizations.
class NotFittedText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign textAlign;
  final int? maxLines;
  const NotFittedText(
    this.text, {
    this.style,
    this.textAlign = TextAlign.center,
    this.maxLines,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: TextStyles(context).normalStyle().merge(style),
        textAlign: textAlign,
        overflow: TextOverflow.clip,
        maxLines: maxLines,
      );
}
