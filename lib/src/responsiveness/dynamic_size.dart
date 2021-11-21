import 'dart:math';

import 'package:flutter/material.dart';

import '../utils/view_type_helper.dart';

class DynamicSize {
  /// Provides dynamic size values (height/width) by using [MediaQueryData].
  /// It provides responsive [height], [width] and [responsiveSize] data
  /// that are changing when you change your window size.
  /// Also contains [EdgeInsets] values for responsive paddings/margins.
  DynamicSize(this.context) {
    _mediaQuery = MediaQuery.of(context);
  }

  final BuildContext context;
  late MediaQueryData _mediaQuery;

  /// One percent of the screen height and width, in terms of pixels.
  double get height => _mediaQuery.size.height * 0.01;
  double get width => _mediaQuery.size.width * 0.01;

  /// Provides responsive base size value by using default 16/9 ratio.
  double get responsiveSize => ViewTypeHelper(context).isLandscape
      ? min(height * 16, width * 9) / 30
      : min(height * 11.7, width * 20.8) / 30;

  /// Further customizes the [height] and [width] values
  /// for integrity across the screen.
  double get lowHeight => height * 1.5;
  double get lowWidth => width * 1.5;

  double get lowMedHeight => height * 2;
  double get lowMedWidth => width * 2;

  double get medWidth => width * 2.8;
  double get medHeight => height * 2.8;

  double get medHighWidth => width * 4.5;

  double get highWidth => width * 6.5;

  /// Creates base [EdgeInsets] values for integrity across the screen.
  EdgeInsets get lowAllPadding =>
      EdgeInsets.symmetric(horizontal: lowWidth, vertical: lowHeight);

  EdgeInsets get lowVerticalPadding =>
      EdgeInsets.symmetric(vertical: lowHeight);

  EdgeInsets get medHighHorizontalPadding =>
      EdgeInsets.symmetric(horizontal: medHighWidth);

  EdgeInsets get lowHorizontalPadding =>
      EdgeInsets.symmetric(horizontal: lowWidth);

  EdgeInsets get lowMedHorizontalPadding =>
      EdgeInsets.symmetric(horizontal: lowMedWidth);

  EdgeInsets get highHorizontalPadding =>
      EdgeInsets.symmetric(horizontal: highWidth);

  EdgeInsets get extremeLowHorizontalPadding =>
      EdgeInsets.symmetric(horizontal: width);

  EdgeInsets get extremeLowRightPadding => EdgeInsets.only(right: width);

  EdgeInsets get lowLeftPadding => EdgeInsets.only(left: lowWidth);
  EdgeInsets get medLeftPadding => EdgeInsets.only(left: medWidth);
  EdgeInsets get medHightLeftPadding => EdgeInsets.only(left: medHighWidth);

  EdgeInsets get lowTopPadding => EdgeInsets.only(top: lowHeight);
  EdgeInsets get medTopPadding => EdgeInsets.only(top: medHeight);

  EdgeInsets get lowMedBottomPadding => EdgeInsets.only(bottom: lowMedHeight);

  /// Maximum width and height of the screen.
  double get maxPossibleHeight => _mediaQuery.size.height;
  double get maxPossibleWidth => _mediaQuery.size.width;
}
