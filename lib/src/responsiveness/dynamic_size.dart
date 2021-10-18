import 'dart:math';

import 'package:flutter/material.dart';

class DynamicSize {
  final BuildContext context;
  DynamicSize(this.context) {
    _mediaQuery = MediaQuery.of(context);
  }

  late MediaQueryData _mediaQuery;

  double get height => _mediaQuery.size.height * 0.01;
  double get width => _mediaQuery.size.width * 0.01;

  double get responsiveSize => min(height * 16, width * 9) / 30;

  double get lowHeight => height * 1.5;
  double get lowWidth => width * 1.5;

  double get lowMedHeight => height * 2;
  double get lowMedWidth => width * 2;

  double get medWidth => width * 2.8;
  double get medHeight => height * 2.8;

  double get medHighWidth => width * 4.5;

  double get highWidth => width * 6.5;

  EdgeInsets get lowAllPadding =>
      EdgeInsets.symmetric(horizontal: lowWidth, vertical: lowHeight);

  EdgeInsets get lowVerticalPadding =>
      EdgeInsets.symmetric(vertical: lowHeight);

  EdgeInsets get medHighHorizontalPadding =>
      EdgeInsets.symmetric(horizontal: medHighWidth);

  EdgeInsets get lowHorizontalPadding =>
      EdgeInsets.symmetric(horizontal: lowWidth);

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

  double get maxPossibleHeight => _mediaQuery.size.height;
  double get maxPossibleWidth => _mediaQuery.size.width;

  Orientation get orientation => _mediaQuery.orientation;
}
