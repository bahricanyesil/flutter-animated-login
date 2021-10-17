import 'package:animated_login/src/responsiveness/dynamic_size.dart';
import 'package:animated_login/src/utils/device_type_helper.dart';
import 'package:flutter/material.dart';

import '../icons/base_icon.dart';

class BaseIconButton extends StatelessWidget {
  final IconData icon;
  final Function() onPressed;
  final double? size;
  const BaseIconButton({
    required this.icon,
    required this.onPressed,
    this.size,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DynamicSize dynamicSize = DynamicSize(context);
    return FittedBox(
      child: Padding(
        padding: dynamicSize.extremeLowHorizontalPadding,
        child: _iconButton,
      ),
    );
  }

  Widget get _iconButton => IconButton(
        splashRadius: 20,
        iconSize: size ?? 24,
        icon: BaseIcon(icon, widthFactor: 3),
        onPressed: onPressed,
      );
}
