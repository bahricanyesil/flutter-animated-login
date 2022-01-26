import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../decorations/button_styles.dart';
import '../../decorations/text_styles.dart';
import '../../providers/login_theme.dart';
import '../../responsiveness/dynamic_size.dart';
import '../texts/base_text.dart';

/// An [ElevatedButton] with rounded corners.
class RoundedButton extends StatelessWidget {
  /// Takes some parameters to customize the design,
  /// and uses "ButtonStyles(context).roundedStyle" to give roundness.
  const RoundedButton({
    required this.buttonText,
    required this.onPressed,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius,
    this.borderWidth = 1.4,
    this.width,
    this.height,
    this.buttonStyle,
    Key? key,
  }) : super(key: key);

  /// Text on the button.
  final String buttonText;

  /// Callback to call on pressed.
  final VoidCallback onPressed;

  /// Background color of the button.
  final Color? backgroundColor;

  /// Border color of the button.
  final Color? borderColor;

  /// Radius of the borders.
  final BorderRadius? borderRadius;

  /// Width of the border.
  final double borderWidth;

  /// Width of the button.
  final double? width;

  /// Height of the button.
  final double? height;

  /// Style of the button.
  final ButtonStyle? buttonStyle;

  @override
  Widget build(BuildContext context) {
    final bool isLandscape = context.read<LoginTheme>().isLandscape;
    return ElevatedButton(
      style: buttonStyle != null
          ? buttonStyle!.merge(_defaultButtonStyle(context, isLandscape))
          : _defaultButtonStyle(context, isLandscape),
      onPressed: onPressed,
      child: BaseText(buttonText, forceDefaultStyle: true),
    );
  }

  /// Calls the rounded style from [ButtonStyles] class with custom parameters.
  ButtonStyle _defaultButtonStyle(BuildContext context, bool isLandscape) =>
      ButtonStyles(context).roundedStyle(
        borderWidth: borderWidth,
        backgroundColor: backgroundColor,
        borderColor: borderColor ?? (isLandscape ? null : Colors.white),
        borderRadius: borderRadius,
        size: Size(
          width ?? DynamicSize(context).width * (isLandscape ? 14 : 30),
          height ?? DynamicSize(context).height * (isLandscape ? 9 : 7.3),
        ),
        textStyle: TextStyles(context).bodyStyle(
          color: isLandscape ? Colors.white : Theme.of(context).primaryColor,
          fontWeight: FontWeight.w500,
        ),
        foregroundColor:
            isLandscape ? Colors.white : Theme.of(context).primaryColor,
      );
}
