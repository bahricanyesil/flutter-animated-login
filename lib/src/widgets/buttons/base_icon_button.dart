import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/login_theme.dart';
import '../../responsiveness/dynamic_size.dart';
import '../icons/base_icon.dart';

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
    final DynamicSize dynamicSize = DynamicSize(context);
    return FittedBox(
      child: Padding(
        padding: dynamicSize.extremeLowRightPadding,
        child: _iconButton(dynamicSize, context),
      ),
    );
  }

  Widget _iconButton(DynamicSize dynamicSize, BuildContext context) {
    final double sizeFactor =
        context.read<LoginTheme>().isLandscape ? 6.5 : 3.2;
    return IconButton(
      splashRadius: 20,
      iconSize: size ?? (dynamicSize.responsiveSize * sizeFactor),
      icon: BaseIcon(
        icon,
        sizeFactor: size ?? (dynamicSize.responsiveSize * sizeFactor),
        padding: EdgeInsets.zero,
      ),
      onPressed: onPressed,
    );
  }
}
