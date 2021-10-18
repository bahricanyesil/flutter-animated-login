import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/login_theme.dart';
import '../../responsiveness/dynamic_size.dart';

/// Provides a circle button with custom stylings.
/// Shapes the button as circle with the given height/width.
class CircleWidget extends StatelessWidget {
  final Widget child;
  final double widthFactor;
  final Function()? onTap;
  final double? borderWidthFactor;
  const CircleWidget({
    required this.child,
    this.widthFactor = 15,
    this.borderWidthFactor,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DynamicSize dynamicSize = DynamicSize(context);
    return SizedBox(
      width: dynamicSize.responsiveSize * widthFactor,
      height: dynamicSize.responsiveSize * widthFactor,
      child: RawMaterialButton(
        onPressed: onTap,
        hoverColor: context.read<LoginTheme>().socialLoginHoverColor ??
            Theme.of(context).primaryColorLight.withOpacity(.7),
        shape: _buttonShape(context),
        padding: EdgeInsets.all(dynamicSize.responsiveSize * widthFactor / 4),
        elevation: 3,
        child: child,
      ),
    );
  }

  /// Returns the border style of the button.
  ShapeBorder _buttonShape(BuildContext context) => CircleBorder(
        side: context.read<LoginTheme>().socialLoginBorder ??
            BorderSide(
              color: Colors.black54,
              width: DynamicSize(context).width * (borderWidthFactor ?? .2),
            ),
      );
}
