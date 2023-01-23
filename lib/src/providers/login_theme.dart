import 'package:flutter/material.dart';

import '../../animated_login.dart';

/// [LoginTheme] is the provider for all design/theme related data.
// ignore: prefer_mixin
class LoginTheme extends LoginViewTheme with ChangeNotifier {
  /// with the help of [LoginViewTheme]. See the details inside of it.
  /// * Additionally tracks whether the app is in landscape mode, [isLandscape].
  LoginTheme({LoginViewTheme? desktopTheme, LoginViewTheme? mobileTheme}) {
    _desktopTheme = desktopTheme;
    _mobileTheme = mobileTheme;
    if (_mobileTheme != null) _currentTheme = _mobileTheme!;
  }
  late final LoginViewTheme? _desktopTheme;
  late final LoginViewTheme? _mobileTheme;

  LoginViewTheme _currentTheme = LoginViewTheme();

  /// Gets the current theme
  LoginViewTheme get currentTheme => _currentTheme;

  /// Sets the current theme
  set currentTheme(LoginViewTheme theme) {
    if (theme != _currentTheme) _currentTheme = theme;
  }

  /// Sets the current theme and notify.
  void setThemeAndNotify(bool isLandscape) {
    final LoginViewTheme? newTheme = isLandscape ? _desktopTheme : _mobileTheme;
    if (newTheme != null && _currentTheme != newTheme) {
      _currentTheme = newTheme;
      WidgetsBinding.instance.addPostFrameCallback((_) => notifyListeners());
    }
  }

  /// Indicates whether the screen size is landscape.
  bool isLandscape = false;

  /// Sets the isLandscape variable.
  void setIsLandscape(bool newValue) {
    isLandscape = newValue;
    setThemeAndNotify(isLandscape);
  }

  @override
  Color? get backgroundColor => currentTheme.backgroundColor;

  @override
  set backgroundColor(Color? paramBgColor) =>
      currentTheme.backgroundColor = paramBgColor;

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
  TextStyle? get privacyPolicyStyle => currentTheme.privacyPolicyStyle;

  @override
  TextStyle? get privacyPolicyLinkStyle => currentTheme.privacyPolicyLinkStyle;

  @override
  EdgeInsets? get welcomePadding => currentTheme.welcomePadding;

  @override
  TextStyle? get welcomeTitleStyle => currentTheme.welcomeTitleStyle;

  @override
  AnimatedDialogTheme? get dialogTheme => currentTheme.dialogTheme;

  @override
  double? get titleDescriptionSpace => currentTheme.titleDescriptionSpace;

  @override
  double? get spacingWithoutSocial => currentTheme.spacingWithoutSocial;

  @Deprecated('Use "actionButtonPadding" instead')
  @override
  double? get spacingFormAndAction => currentTheme.spacingFormAndAction;

  @override
  EdgeInsets? get forgotPasswordPadding => currentTheme.forgotPasswordPadding;

  @Deprecated(
      'Use "changeActionPadding" or "changeActionButtonPadding" instead')
  @override
  double? get actionAndChangeActionSpacing =>
      currentTheme.actionAndChangeActionSpacing;

  @override
  EdgeInsets? get logoPadding => currentTheme.logoPadding;

  @override
  Color? get socialHighlightColor => currentTheme.socialHighlightColor;

  @override
  EdgeInsets? get inputPadding => currentTheme.inputPadding;

  @override
  double? get loadingButtonSize => currentTheme.loadingButtonSize;

  @override
  bool get showLoadingButton => currentTheme.showLoadingButton;

  @override
  bool get showLoadingSocialButton => currentTheme.showLoadingSocialButton;

  @override
  Color? get loadingButtonColor => currentTheme.loadingButtonColor;

  @override
  Color? get loadingSocialButtonColor => currentTheme.loadingSocialButtonColor;

  @override
  Color? get checkColor => currentTheme.checkColor;

  @override
  Color? get borderColor => currentTheme.borderColor;

  @override
  Color? get fillColor => currentTheme.fillColor;

  @override
  EdgeInsets? get titlePadding => currentTheme.titlePadding;

  @override
  EdgeInsets? get descriptionPadding => currentTheme.descriptionPadding;

  @override
  EdgeInsets? get changeActionPadding => currentTheme.changeActionPadding;

  @override
  EdgeInsets? get changeActionButtonPadding =>
      currentTheme.changeActionButtonPadding;

  @override
  EdgeInsets? get useEmailPadding => currentTheme.useEmailPadding;

  @override
  EdgeInsets? get socialLoginPadding => currentTheme.socialLoginPadding;

  @override
  EdgeInsets? get formTitlePadding => currentTheme.formTitlePadding;

  @override
  EdgeInsets? get actionButtonPadding => currentTheme.actionButtonPadding;

  @override
  List<AnimatedComponent> get animatedComponentOrder =>
      currentTheme.animatedComponentOrder;
}
