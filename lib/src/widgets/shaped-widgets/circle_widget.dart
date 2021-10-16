import 'package:flutter/material.dart';

import '../../decorations/box_decorations.dart';
import '../../responsiveness/dynamic_size.dart';

class CircleWidget extends StatelessWidget {
  final Widget child;
  final double widthFactor;
  final Function()? onTap;
  final double? borderWidthFactor;
  const CircleWidget({
    required this.child,
    this.widthFactor = 4,
    this.borderWidthFactor,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DynamicSize dynamicSize = DynamicSize(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(dynamicSize.width * widthFactor / 4.4),
        alignment: Alignment.center,
        decoration: BoxDecorations(context)
            .circleDeco(borderWidthFactor: borderWidthFactor),
        width: dynamicSize.width * widthFactor,
        child: child,
      ),
    );
  }
}
