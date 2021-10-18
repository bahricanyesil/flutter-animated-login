import 'package:flutter/material.dart';

class LoginTheme with ChangeNotifier {
  LoginTheme({
    this.formTitleStyle,
    this.welcomeTitleStyle,
    this.welcomeDescriptionStyle,
    this.changeActionStyle,
    this.useEmailStyle,
    this.forgotPasswordStyle,
    this.hintTextStyle,
    this.errorTextStyle,
    this.textFormStyle,
    this.actionTextStyle,
    this.changeActionTextStyle,
    this.textFormFieldDeco,
    this.nameIcon,
    this.emailIcon,
    this.passwordIcon,
    this.formFieldElevation,
    this.formFieldBackgroundColor,
    this.formFieldShadowColor,
    this.formFieldBorderRadius,
    this.formFieldSize,
    this.formFieldHoverColor,
    this.backgroundColor,
    this.errorBorderColor,
    this.focusedErrorBorderColor,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.errorBorder,
    this.enabledBorder,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.showFormFieldErrors = true,
    this.showLabelTexts = true,
    this.socialLoginHoverColor,
    this.socialLoginBorder,
  });

  /// Text style for the title of form part.
  final TextStyle? formTitleStyle;

  /// Text style for the title of welcome part.
  final TextStyle? welcomeTitleStyle;

  /// Text style for the description of welcome part.
  final TextStyle? welcomeDescriptionStyle;

  /// Text style for the change action CTA of welcome part.
  final TextStyle? changeActionStyle;

  /// Text style for the use email text of form part.
  final TextStyle? useEmailStyle;

  /// Text style for the forgot password CTA of form part.
  final TextStyle? forgotPasswordStyle;

  /// Text style for hint texts in the text form fields.
  final TextStyle? hintTextStyle;

  /// Text style for error texts in the text form fields.
  final TextStyle? errorTextStyle;

  /// Text style for input texts in the text form fields.
  final TextStyle? textFormStyle;

  /// Text style for action button text in the form part.
  final TextStyle? actionTextStyle;

  /// Text style for change action button text in the welcome part.
  final TextStyle? changeActionTextStyle;

  /// Input decoration for the text form fields.
  final InputDecoration? textFormFieldDeco;

  /// Prefix widget for name text form field.
  final Widget? nameIcon;

  /// Prefix widget for email text form field.
  final Widget? emailIcon;

  /// Prefix widget for password text form field.
  final Widget? passwordIcon;

  /// Elevation for text form fields.
  final double? formFieldElevation;

  /// Background color for text form fields.
  final Color? formFieldBackgroundColor;

  /// Shadow color for text form fields.
  final Color? formFieldShadowColor;

  /// Border radius for text form fields.
  final BorderRadius? formFieldBorderRadius;

  /// Size of text form fields.
  final Size? formFieldSize;

  /// Hover color for text form fields.
  final Color? formFieldHoverColor;

  /// Background color of the login screen.
  final Color? backgroundColor;

  /// Error border color for text form fields.
  final Color? errorBorderColor;

  /// Focused error border color for text form fields.
  final Color? focusedErrorBorderColor;

  /// Focused border color for text form fields.
  final Color? focusedBorderColor;

  /// Enabled border color for text form fields.
  final Color? enabledBorderColor;

  /// Enabled border for text form fields.
  final InputBorder? enabledBorder;

  /// Error border for text form fields.
  final InputBorder? errorBorder;

  /// Focused error border for text form fields.
  final InputBorder? focusedErrorBorder;

  /// Focused border for text form fields.
  final InputBorder? focusedBorder;

  /// Indicates whether the error messages should be displayed
  /// below the text form fields.
  final bool showFormFieldErrors;

  /// Indicates whether the labels should be displayed
  /// above the text form fields.
  final bool showLabelTexts;

  /// Hover color for social login widgets.
  final Color? socialLoginHoverColor;

  /// Border for social login widgets.
  final BorderSide? socialLoginBorder;
}
