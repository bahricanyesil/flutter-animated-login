import 'package:flutter/material.dart';

// TODO(bahrican):
class LoginTheme with ChangeNotifier {
  LoginTheme({
    this.formTitleStyle,
    this.backgroundColor,
  });

  /// Text style for the title of form part.
  final TextStyle? formTitleStyle;

  /// Background color to filter the background image.
  final Color? backgroundColor;
}
