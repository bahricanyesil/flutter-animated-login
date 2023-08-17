import 'package:animated_login/src/responsiveness/dynamic_size.dart';
import 'package:animated_login/src/widgets/icons/base_icon.dart';
import 'package:flutter/material.dart';

/// Base icon button with custom parameters
class BaseIconButton extends StatelessWidget {
  /// Wraps [IconButton] with [FittedBox], and gives some paddings.
  const BaseIconButton({
    required this.icon,
    required this.onPressed,
    this.size,
    Key? key,
  }) : super(key: key);

  /// Icon of the button.
  final IconData icon;

  /// Callback to call on pressed.
  final VoidCallback onPressed;

  /// Size of the button.
  final double? size;

  @override
  Widget build(BuildContext context) {
    final dynamicSize = DynamicSize(context);
    return FittedBox(
      child: Padding(
        padding: dynamicSize.extremeLowRightPadding,
        child: _iconButton(dynamicSize, context),
      ),
    );
  }

  Widget _iconButton(DynamicSize dynamicSize, BuildContext context) {
    final sizeFactor = size == null ? 6.5 : size! / dynamicSize.responsiveSize;
    return IconButton(
      splashRadius: 20,
      iconSize: dynamicSize.responsiveSize * sizeFactor,
      icon: BaseIcon(icon, sizeFactor: sizeFactor, padding: EdgeInsets.zero),
      onPressed: onPressed,
    );
  }
}
