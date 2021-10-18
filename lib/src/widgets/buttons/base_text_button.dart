import 'package:flutter/material.dart';

import '../../decorations/button_styles.dart';
import '../../decorations/text_styles.dart';
import '../../responsiveness/dynamic_size.dart';
import '../texts/base_text.dart';

class BaseTextButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final TextStyle? style;
  const BaseTextButton({
    required this.text,
    required this.onPressed,
    this.style,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DynamicSize dynamicSize = DynamicSize(context);
    return FittedBox(
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyles(context).textButtonStyle(
          padding: EdgeInsets.all(dynamicSize.height * 2),
        ),
        child: BaseText(
          text,
          style: style ?? TextStyles(context).normalStyle(),
        ),
      ),
    );
  }
}
