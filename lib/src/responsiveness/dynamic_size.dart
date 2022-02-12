import 'dart:math';

import 'package:flutter/material.dart';

/// Provides dynamic size values (height/width) by using [MediaQueryData].
class DynamicSize {
  /// It provides responsive [height], [width] and [responsiveSize] data
  /// that are changing when you change your window size.
  /// Also contains [EdgeInsets] values for responsive paddings/margins.
  DynamicSize(this.context) {
    _mediaQuery = MediaQuery.of(context);
  }

  /// Context to customize responsively.
  final BuildContext context;
  late MediaQueryData _mediaQuery;

  /// One percent of the screen height, in terms of pixels.
  double get height => _mediaQuery.size.height * 0.01;

  /// One percent of the screen width, in terms of pixels.
  double get width => _mediaQuery.size.width * 0.01;

  /// Provides responsive base size value by using default 16/9 ratio.
  double get responsiveSize => height / width < 1.05
      ? min(height * 16, width * 9) / 30
      : min(height * 11.7, width * 20.8) / 30;

  /// Customized low height value.
  double get lowHeight => height * 1.5;

  /// Customized low width value.
  double get lowWidth => width * 1.5;

  /// Customized low-medium height value.
  double get lowMedHeight => height * 2;

  /// Customized low-medium width value.
  double get lowMedWidth => width * 2;

  /// Customized medium width value.
  double get medWidth => width * 2.8;

  /// Customized medium height value.
  double get medHeight => height * 2.8;

  /// Customized medium-high width value.
  double get medHighWidth => width * 4.5;

  /// Customized high width value.
  double get highWidth => width * 6.5;

  /// Low all padding.
  EdgeInsets get lowAllPadding =>
      EdgeInsets.symmetric(horizontal: lowWidth, vertical: lowHeight);

  /// Low-Medium all padding.
  EdgeInsets get lowMedAllPadding =>
      EdgeInsets.symmetric(vertical: lowMedHeight, horizontal: lowMedHeight);

  /// Low vertical padding.
  EdgeInsets get lowVerticalPadding =>
      EdgeInsets.symmetric(vertical: lowHeight);

  /// Medium-high horizontal padding.
  EdgeInsets get medHighHorizontalPadding =>
      EdgeInsets.symmetric(horizontal: medHighWidth);

  /// Low horizontal padding.
  EdgeInsets get lowHorizontalPadding =>
      EdgeInsets.symmetric(horizontal: lowWidth);

  /// Low-medium horizontal padding.
  EdgeInsets get lowMedHorizontalPadding =>
      EdgeInsets.symmetric(horizontal: lowMedWidth);

  /// High horizontal padding.
  EdgeInsets get highHorizontalPadding =>
      EdgeInsets.symmetric(horizontal: highWidth);

  /// Extreme low horizontal padding.
  EdgeInsets get extremeLowHorizontalPadding =>
      EdgeInsets.symmetric(horizontal: width);

  /// Extreme low right padding.
  EdgeInsets get extremeLowRightPadding => EdgeInsets.only(right: width);

  /// Low left padding.
  EdgeInsets get lowLeftPadding => EdgeInsets.only(left: lowWidth);

  /// Medium left padding.
  EdgeInsets get medLeftPadding => EdgeInsets.only(left: medWidth);

  /// Medium-high left padding
  EdgeInsets get medHighLeftPadding => EdgeInsets.only(left: medHighWidth);

  /// Low top padding.
  EdgeInsets get lowTopPadding => EdgeInsets.only(top: lowHeight);

  /// Medium top padding.
  EdgeInsets get medTopPadding => EdgeInsets.only(top: medHeight);

  /// Low-medium bottom padding.
  EdgeInsets get lowMedBottomPadding => EdgeInsets.only(bottom: lowMedHeight);

  /// Low bottom padding.
  EdgeInsets get lowBottomPadding => EdgeInsets.only(bottom: lowHeight);

  /// Maximum height of the screen.
  double get maxPossibleHeight => _mediaQuery.size.height;

  /// Maximum width of the screen.
  double get maxPossibleWidth => _mediaQuery.size.width;
}
