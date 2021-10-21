import 'package:flutter/material.dart';

import '../../responsiveness/dynamic_size.dart';
import '../icons/base_icon.dart';

/// Base icon button with custom parameters
/// Wraps [IconButton] with [FittedBox], and gives some paddings.
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
        padding: dynamicSize.extremeLowRightPadding,
        child: _iconButton(dynamicSize),
      ),
    );
  }

  Widget _iconButton(DynamicSize dynamicSize) => IconButton(
        splashRadius: 20,
        iconSize: size ?? dynamicSize.responsiveSize * 6.5,
        icon: BaseIcon(icon, sizeFactor: size ?? 6.5, padding: EdgeInsets.zero),
        onPressed: onPressed,
      );
}
