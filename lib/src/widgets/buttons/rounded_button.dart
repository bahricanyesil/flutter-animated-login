import 'package:animated_login/src/decorations/text_styles.dart';
import 'package:flutter/material.dart';

import '../../decorations/button_styles.dart';
import '../../responsiveness/dynamic_size.dart';
import '../texts/base_text.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    required this.buttonText,
    required this.onPressed,
    this.backgroundColor,
    this.borderColor,
    this.iconPath,
    this.borderRadius,
    this.borderWidth = 1.4,
    this.textStyle,
    this.width,
    this.height,
    Key? key,
  }) : super(key: key);

  final String buttonText;
  final Function() onPressed;
  final Color? backgroundColor;
  final Color? borderColor;
  final String? iconPath;
  final BorderRadius? borderRadius;
  final double borderWidth;
  final TextStyle? textStyle;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ButtonStyles(context).roundedStyle(
          borderWidth: borderWidth,
          backgroundColor: backgroundColor,
          borderColor: borderColor,
          borderRadius: borderRadius,
          width: width,
          height: height,
        ),
        onPressed: onPressed,
        child: getRow(context),
      );

  Widget getRow(BuildContext context) => Padding(
        padding: DynamicSize(context).lowAllPadding,
        child: Row(
          children: <Widget>[
            if (iconPath == null)
              Expanded(child: Container())
            else
              preImage(context),
            BaseText(
              buttonText,
              style: TextStyles(context).bodyStyle(),
            ),
            Expanded(child: Container()),
          ],
        ),
      );

  /// By default uses "assets/images" directory as base and
  /// "png" as a default file type.
  Widget preImage(BuildContext context) => Expanded(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: DynamicSize(context).lowAllPadding,
            child: Image.asset('assets/images/$iconPath.png'),
          ),
        ),
      );
}
