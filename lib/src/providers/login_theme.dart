import 'package:flutter/material.dart';

// TODO(bahrican):
class LoginTheme with ChangeNotifier {
  LoginTheme({
    this.formTitleStyle,
    this.welcomeTitleStyle,
    this.welcomeDescriptionStyle,
    this.changeActionStyle,
    this.useEmailStyle,
    this.forgotPasswordStyle,
    this.backgroundColor,
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

  /// Background color to filter the background image.
  final Color? backgroundColor;
}
