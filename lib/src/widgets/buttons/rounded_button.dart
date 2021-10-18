import 'package:flutter/material.dart';

import '../../decorations/button_styles.dart';
import '../../decorations/text_styles.dart';
import '../../responsiveness/dynamic_size.dart';
import '../texts/base_text.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    required this.buttonText,
    required this.onPressed,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius,
    this.borderWidth = 1.4,
    this.textStyle,
    this.width,
    this.height,
    this.buttonStyle,
    Key? key,
  }) : super(key: key);

  final String buttonText;
  final Function() onPressed;
  final Color? backgroundColor;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final double borderWidth;
  final TextStyle? textStyle;
  final double? width;
  final double? height;
  final ButtonStyle? buttonStyle;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: buttonStyle != null
            ? buttonStyle!.merge(_defaultButtonStyle(context))
            : _defaultButtonStyle(context),
        onPressed: onPressed,
        child: BaseText(
          buttonText,
          style: TextStyles(context).bodyStyle().merge(textStyle),
        ),
      );

  ButtonStyle _defaultButtonStyle(BuildContext context) =>
      ButtonStyles(context).roundedStyle(
        borderWidth: borderWidth,
        backgroundColor: backgroundColor,
        borderColor: borderColor,
        borderRadius: borderRadius,
        width: width ?? DynamicSize(context).width * 14,
        height: height ?? DynamicSize(context).height * 9,
      );
}
