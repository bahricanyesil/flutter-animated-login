import 'package:flutter/material.dart';

class DynamicSize {
  final BuildContext context;
  DynamicSize(this.context) {
    _mediaQuery = MediaQuery.of(context);
  }

  late MediaQueryData _mediaQuery;

  double get height => _mediaQuery.size.height * 0.01;
  double get width => _mediaQuery.size.width * 0.01;

  double get lowHeight => height * 1.5;
  double get lowWidth => width * 1.5;

  double get medHeight => height * 2.8;

  double get medHighWidth => width * 5;

  double get highWidth => width * 8;

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

  EdgeInsets get medTopPadding => EdgeInsets.only(top: medHeight);

  double get maxPossibleHeight => _mediaQuery.size.height;
  double get maxPossibleWidth => _mediaQuery.size.width;

  Orientation get orientation => _mediaQuery.orientation;
}
