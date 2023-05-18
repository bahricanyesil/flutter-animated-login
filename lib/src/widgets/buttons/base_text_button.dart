import 'package:animated_login/src/decorations/button_styles.dart';
import 'package:animated_login/src/decorations/text_styles.dart';
import 'package:animated_login/src/responsiveness/dynamic_size.dart';
import 'package:animated_login/src/widgets/texts/base_text.dart';
import 'package:flutter/material.dart';

/// Base text button with custom parameters
class BaseTextButton extends StatelessWidget {
  /// Wraps [TextButton] with [FittedBox], and gives some paddings.
  const BaseTextButton({
    required this.text,
    required this.onPressed,
    this.style,
    this.padding,
    Key? key,
  }) : super(key: key);

  /// Text of the button.
  final String text;

  /// Callback to call on pressed.
  final VoidCallback onPressed;

  /// Style of the [text].
  final TextStyle? style;

  /// Padding inside the button.
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final dynamicSize = DynamicSize(context);
    return FittedBox(
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyles(context).textButtonStyle(
          padding: padding ?? EdgeInsets.all(dynamicSize.responsiveSize * 3),
        ),
        child: BaseText(
          text,
          style: TextStyles(context).normalStyle().merge(style),
        ),
      ),
    );
  }
}
