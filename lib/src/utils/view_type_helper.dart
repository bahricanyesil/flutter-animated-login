import 'package:animated_login/src/responsiveness/dynamic_size.dart';
import 'package:flutter/material.dart';

/// View type helper to understand whether the screen is in landscape mode.
/// * See [isLandscape]
class ViewTypeHelper {
  /// Default constructor for [ViewTypeHelper].
  const ViewTypeHelper(this.context);

  /// Context for dynamic size.
  final BuildContext context;

  ///  Returns whether the screen is in landscape mode.
  bool get isLandscape {
    final dynamicSize = DynamicSize(context);
    return dynamicSize.height / dynamicSize.width < 1.05;
  }
}
