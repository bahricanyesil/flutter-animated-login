import 'package:flutter/material.dart';

import '../models/animated_dialog_theme.dart';
import 'login_view_theme.dart';

class LoginTheme extends LoginViewTheme with ChangeNotifier {
  /// [LoginTheme] is the provider for all design/theme related data.
  /// with the help of [LoginViewTheme]. See the details inside of it.
  /// * Additionally tracks whether the app is in landscape mode, [isLandscape].
  LoginTheme({LoginViewTheme? initialTheme}) {
    _currentTheme = initialTheme ?? LoginViewTheme();
  }

  late LoginViewTheme _currentTheme;
  LoginViewTheme get currentTheme => _currentTheme;
  set currentTheme(LoginViewTheme theme) {
    _currentTheme = theme;
    notifyListeners();
  }

  /// Indicates whether the screen size is landscape.
  bool isLandscape = true;
  void setIsLandscape(bool newValue) {
    isLandscape = newValue;
    notifyListeners();
  }

  @override
  Color? get backgroundColor => currentTheme.backgroundColor;

  @override
  set backgroundColor(Color? _backgroundColor) =>
      currentTheme.backgroundColor = _backgroundColor;

  @override
  ButtonStyle? get actionButtonStyle => currentTheme.actionButtonStyle;

  @override
  Curve get animationCurve => currentTheme.animationCurve;

  @override
  Duration? get animationDuration => currentTheme.animationDuration;

  @override
  ButtonStyle? get changeActionButtonStyle =>
      currentTheme.changeActionButtonStyle;

  @override
  TextStyle? get changeActionTextStyle => currentTheme.changeActionTextStyle;

  @override
  ButtonStyle? get changeLangButtonStyle => currentTheme.changeLangButtonStyle;

  @override
  TextStyle? get changeLangButtonTextStyle =>
      currentTheme.changeLangButtonTextStyle;

  @override
  Color? get changeLangContentColor => currentTheme.changeLangContentColor;

  @override
  Widget? get emailIcon => currentTheme.emailIcon;

  @override
  InputBorder? get enabledBorder => currentTheme.enabledBorder;

  @override
  Color? get enabledBorderColor => currentTheme.enabledBorderColor;

  @override
  InputBorder? get errorBorder => currentTheme.errorBorder;

  @override
  Color? get errorBorderColor => currentTheme.errorBorderColor;

  @override
  TextStyle? get errorTextStyle => currentTheme.errorTextStyle;

  @override
  InputBorder? get focusedBorder => currentTheme.focusedBorder;

  @override
  Color? get focusedBorderColor => currentTheme.focusedBorderColor;

  @override
  InputBorder? get focusedErrorBorder => currentTheme.focusedErrorBorder;

  @override
  Color? get focusedErrorBorderColor => currentTheme.focusedErrorBorderColor;

  @override
  TextStyle? get forgotPasswordStyle => currentTheme.forgotPasswordStyle;

  @override
  double? get formElementsSpacing => currentTheme.formElementsSpacing;

  @override
  Color? get formFieldBackgroundColor => currentTheme.formFieldBackgroundColor;

  @override
  BorderRadius? get formFieldBorderRadius => currentTheme.formFieldBorderRadius;

  @override
  double? get formFieldElevation => currentTheme.formFieldElevation;

  @override
  Color? get formFieldHoverColor => currentTheme.formFieldHoverColor;

  @override
  Color? get formFieldShadowColor => currentTheme.formFieldShadowColor;

  @override
  Size? get formFieldSize => currentTheme.formFieldSize;

  @override
  EdgeInsets? get formPadding => currentTheme.formPadding;

  @override
  TextStyle? get formTitleStyle => currentTheme.formTitleStyle;

  @override
  double get formWidthRatio => currentTheme.formWidthRatio;

  @override
  TextStyle? get hintTextStyle => currentTheme.hintTextStyle;

  @override
  Size? get logoSize => currentTheme.logoSize;

  @override
  Widget? get nameIcon => currentTheme.nameIcon;

  @override
  Widget? get passwordIcon => currentTheme.passwordIcon;

  @override
  bool get showLabelTexts => currentTheme.showLabelTexts;

  @override
  BorderSide? get socialLoginBorder => currentTheme.socialLoginBorder;

  @override
  Color? get socialLoginHoverColor => currentTheme.socialLoginHoverColor;

  @override
  double? get socialLoginsSpacing => currentTheme.socialLoginsSpacing;

  @override
  InputDecoration? get textFormFieldDeco => currentTheme.textFormFieldDeco;

  @override
  TextStyle? get textFormStyle => currentTheme.textFormStyle;

  @override
  TextStyle? get useEmailStyle => currentTheme.useEmailStyle;

  @override
  TextStyle? get welcomeDescriptionStyle =>
      currentTheme.welcomeDescriptionStyle;

  @override
  EdgeInsets? get welcomePadding => currentTheme.welcomePadding;

  @override
  TextStyle? get welcomeTitleStyle => currentTheme.welcomeTitleStyle;

  @override
  AnimatedDialogTheme? get dialogTheme => currentTheme.dialogTheme;
}
