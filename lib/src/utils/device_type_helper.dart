import 'package:flutter/material.dart';

import '../constants/enums/view_types.dart';
import '../responsiveness/dynamic_size.dart';

class DeviceTypeHelper {
  final BuildContext context;
  const DeviceTypeHelper(this.context);

  ViewTypes viewType({BoxConstraints? constraints}) {
    final DynamicSize dynamicSize = DynamicSize(context);
    double maxWidth = dynamicSize.maxPossibleWidth;
    double maxHeight = dynamicSize.maxPossibleHeight;
    if (constraints != null) {
      maxWidth = constraints.maxWidth;
      maxHeight = constraints.maxHeight;
    }
    if (maxWidth / maxHeight < 1.2) {
      return ViewTypes.portrait;
    } else {
      return ViewTypes.landscape;
    }
  }

  bool get isLandscape => viewType() == ViewTypes.landscape;
}
