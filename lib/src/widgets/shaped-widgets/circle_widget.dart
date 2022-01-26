import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/login_theme.dart';
import '../../responsiveness/dynamic_size.dart';

/// Provides a circle button with custom stylings.
class CircleWidget extends StatelessWidget {
  /// Shapes the button as circle with the given height/width.
  const CircleWidget({
    required this.child,
    this.widthFactor = 13,
    this.borderWidthFactor,
    this.onTap,
    this.color,
    this.hoverColor,
    this.border,
    Key? key,
  }) : super(key: key);

  /// Child of the circle wrapper.
  final Widget child;

  /// Width factor.
  final double widthFactor;

  /// VoidCallback to call on tap.
  final VoidCallback? onTap;

  /// Width factor for the borders.
  final double? borderWidthFactor;

  /// Color of the widget.
  final Color? color;

  /// Hover color.
  final Color? hoverColor;

  /// Cutom border style.
  final BorderSide? border;

  @override
  Widget build(BuildContext context) {
    final DynamicSize dynamicSize = DynamicSize(context);
    return SizedBox(
      width: dynamicSize.responsiveSize * widthFactor,
      height: dynamicSize.responsiveSize * widthFactor,
      child: RawMaterialButton(
        onPressed: onTap,
        hoverColor: hoverColor ??
            (color?.withOpacity(.7) ??
                Theme.of(context).primaryColorLight.withOpacity(.7)),
        highlightColor: context.read<LoginTheme>().socialHighlightColor ??
            (color?.withOpacity(.7) ??
                Theme.of(context).primaryColorLight.withOpacity(.7)),
        shape: _buttonShape(context),
        padding: EdgeInsets.all(dynamicSize.responsiveSize * widthFactor / 4),
        elevation: 3,
        child: child,
      ),
    );
  }

  /// Returns the border style of the button.
  ShapeBorder _buttonShape(BuildContext context) => CircleBorder(
        side: border ??
            BorderSide(
              color: color ?? Colors.black54,
              width: DynamicSize(context).width * (borderWidthFactor ?? .2),
            ),
      );
}
