import 'package:flutter/material.dart';

import '../responsiveness/dynamic_size.dart';

/// [TextStyles] class collects all customized [TextStyle] in one file.
class TextStyles {
  /// * Initializes [_dynamicSize] since it is used to determine fontSize.
  TextStyles(this.context) {
    _dynamicSize = DynamicSize(context);
  }

  /// Context to customize responsively.
  final BuildContext context;
  late final DynamicSize _dynamicSize;

  /// Custom text style for titles in the login screen.
  /// Such as: "welcome", "loginFormTitle" and so on.
  TextStyle titleStyle({Color? color}) => TextStyle(
        fontSize: _dynamicSize.responsiveSize * 11.5,
        color: color ?? Theme.of(context).primaryColor,
        fontWeight: FontWeight.bold,
        wordSpacing: 3.5,
        letterSpacing: 1.3,
      );

  /// Custom text style for body texts in the login screen.
  /// Such as: "welcomeDescription", "RoundedButton" action text and so on.
  TextStyle bodyStyle({Color? color, FontWeight? fontWeight}) => TextStyle(
        fontSize: _dynamicSize.responsiveSize * 6.8,
        color: color ?? Colors.white.withOpacity(.8),
        fontWeight: fontWeight ?? FontWeight.w500,
        wordSpacing: 2.8,
        letterSpacing: 1.2,
      );

  /// Custom text style for subbody texts in the login screen.
  /// Such as: "forgotPassword" text.
  TextStyle subBodyStyle({Color? color, TextDecoration? decoration}) =>
      TextStyle(
        fontSize: _dynamicSize.responsiveSize * 5.5,
        color: color ?? Colors.white.withOpacity(.8),
        fontWeight: FontWeight.w400,
        wordSpacing: 2.4,
        letterSpacing: 1.1,
        decoration: decoration,
      );

  /// Custom text style for normal/regular texts in the login screen.
  /// Such as: "BaseText"/"NotFittedText" texts and so on.
  TextStyle normalStyle({Color? color}) => TextStyle(
        fontSize: _dynamicSize.responsiveSize * 10,
        color: color ?? Colors.white.withOpacity(.8),
        fontWeight: FontWeight.w500,
        wordSpacing: 3,
        letterSpacing: 1.2,
      );

  /// Custom text style for text form field texts.
  /// Such as: "CustomTextFormField"/"ObscuredTextFormFields" texts.
  TextStyle textFormStyle({Color? color}) => TextStyle(
        fontSize: _dynamicSize.responsiveSize * 5.2,
        color: color ?? Theme.of(context).primaryColor,
        fontWeight: FontWeight.w400,
        wordSpacing: 1.1,
        letterSpacing: .7,
      );

  /// Custom text style for text form field hint/label texts.
  /// Such as: "CustomTextFormField"/"ObscuredTextFormFields" hint texts.
  TextStyle hintTextStyle({Color? color}) => TextStyle(
        fontSize: _dynamicSize.responsiveSize * 5.2,
        color: color,
        fontWeight: FontWeight.w400,
        wordSpacing: 1.1,
        letterSpacing: .7,
      );

  /// Custom text style for text form field error texts.
  /// Such as: "CustomTextFormField"/"ObscuredTextFormFields" error texts.
  TextStyle errorTextStyle({Color? color}) => TextStyle(
        fontSize: _dynamicSize.responsiveSize * 3.5,
        color: color ?? Colors.red[400],
        wordSpacing: 1.5,
        height: .9,
      );

  /// Custom text style for subtitle/comparably smaller texts.
  /// Such as: "useEmailText"/"notHaveAnAccount" texts.
  TextStyle subtitleTextStyle(
          {Color? color, FontWeight? fontWeight, TextDecoration? decoration}) =>
      TextStyle(
        fontSize: _dynamicSize.responsiveSize * 4.8,
        color: color ?? Colors.white.withOpacity(.8),
        fontWeight: fontWeight ?? FontWeight.w400,
        decoration: decoration,
      );

  /// Custom text style for dialog content.
  TextStyle dialogTextStyle(
          {Color? color, FontWeight? fontWeight, TextDecoration? decoration}) =>
      TextStyle(
        fontSize: _dynamicSize.responsiveSize * 5.2,
        color: color ?? Colors.black.withOpacity(.8),
        fontWeight: fontWeight ?? FontWeight.w400,
        letterSpacing: .8,
        wordSpacing: 1.5,
        decoration: decoration,
      );
}
