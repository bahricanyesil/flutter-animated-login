import 'package:flutter/material.dart';

import '../responsiveness/dynamic_size.dart';

class ViewTypeHelper {
  /// View type helper to understand whether the screen is in landscape mode.
  /// * See [isLandscape]
  const ViewTypeHelper(this.context);
  final BuildContext context;

  bool get isLandscape {
    final DynamicSize dynamicSize = DynamicSize(context);
    return dynamicSize.height / dynamicSize.width < 1.05;
  }
}
