import 'package:flutter/material.dart';

import '../responsiveness/dynamic_size.dart';

class BoxDecorations {
  const BoxDecorations(this.context);
  final BuildContext context;

  BoxDecoration circleDeco({
    Color color = Colors.white,
    Color borderColor = Colors.black54,
    double? borderWidthFactor,
  }) =>
      BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(
          color: borderColor,
          width: DynamicSize(context).width * (borderWidthFactor ?? .2),
        ),
      );
}
