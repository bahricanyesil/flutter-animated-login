import 'package:flutter/material.dart';

/// [LoginTheme] is the provider for all design/theme related data.
/// You can customize the colors, text styles, elevation, borders and lots of
/// other customizable fields implemented in this package. For the values that
/// are indirectly used from theme, you should customize your theme.
class LoginTheme with ChangeNotifier {
  LoginTheme({
    this.formTitleStyle,
    this.welcomeTitleStyle,
    this.welcomeDescriptionStyle,
    this.changeActionTextStyle,
    this.useEmailStyle,
    this.forgotPasswordStyle,
    this.hintTextStyle,
    this.errorTextStyle,
    this.textFormStyle,
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
    this.showLabelTexts = true,
    this.socialLoginHoverColor,
    this.socialLoginBorder,
    this.changeLangButtonStyle,
    this.changeLangContentColor,
    this.changeLangButtonTextStyle,
    this.actionButtonStyle,
    this.changeActionButtonStyle,
    this.animationCurve = const Cubic(0.85, 0.40, 0.40, 0.85),
    this.formWidthRatio = 60,
    this.animationDuration,
    this.formElementsSpacing,
    this.formPadding,
    this.logoSize,
    this.socialLoginsSpacing,
    this.welcomePadding,
  })  : assert(formWidthRatio >= 50, "Form width ratio should be at least 50."),
        assert(formElementsSpacing == null || formElementsSpacing <= 70,
            "Spacing between the form elements cannot be more than 70."),
        assert(socialLoginsSpacing == null || socialLoginsSpacing <= 200,
            "Social logins spacing cannot be more than 200."),
        assert(socialLoginsSpacing == null || socialLoginsSpacing <= 200,
            "Social logins spacing cannot be more than 200."),
        assert(logoSize == null || logoSize <= const Size(500, 400),
            "Logo size cannot be more than Size(500, 400).");

  /// Text style for the title of form part.
  final TextStyle? formTitleStyle;

  /// Text style for the title of welcome part.
  final TextStyle? welcomeTitleStyle;

  /// Text style for the description of welcome part.
  final TextStyle? welcomeDescriptionStyle;

  /// Text style for the change action CTA of welcome part.
  final TextStyle? changeActionTextStyle;

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
  Color? backgroundColor;

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

  /// Indicates whether the labels should be displayed
  /// above the text form fields.
  final bool showLabelTexts;

  /// Hover color for social login widgets.
  final Color? socialLoginHoverColor;

  /// Border for social login widgets.
  final BorderSide? socialLoginBorder;

  /// Custom button style for change language button.
  final ButtonStyle? changeLangButtonStyle;

  /// Custom color for change language button text and icon.
  final Color? changeLangContentColor;

  /// Custom text style for change language button text.
  final TextStyle? changeLangButtonTextStyle;

  /// Custom button style for action button (login/signup).
  final ButtonStyle? actionButtonStyle;

  /// Custom button style for change action button that will switch auth mode.
  final ButtonStyle? changeActionButtonStyle;

  /// Padding of the welcome part widget.
  final EdgeInsets? welcomePadding;

  /// Padding of the form part widget.
  final EdgeInsets? formPadding;

  /// Size of the logo in the welcome part.
  final Size? logoSize;

  /// The spacing between the elements of form.
  final double? formElementsSpacing;

  /// The spacing between the social login options.
  final double? socialLoginsSpacing;

  /// Custom animation curve that will be used for animations.
  final Curve animationCurve;

  /// Ratio of width of the form to the width of the screen in percentage.
  final double formWidthRatio;

  /// The duration of the animations.
  final Duration? animationDuration;

  /// Indicates whether the screen size is landscape.
  bool isLandscape = true;
  void setIsLandscape(bool newValue) {
    isLandscape = newValue;
    notifyListeners();
  }
}
