import 'package:flutter/material.dart';

import '../responsiveness/dynamic_size.dart';

class ViewTypeHelper {
  const ViewTypeHelper(this.context);
  final BuildContext context;

  bool get isLandscape {
    final DynamicSize dynamicSize = DynamicSize(context);
    return dynamicSize.height / dynamicSize.width < 1.05;
  }
}
