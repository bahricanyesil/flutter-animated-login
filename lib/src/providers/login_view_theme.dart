import 'package:flutter/material.dart';

import '../../animated_login.dart';

/// [LoginViewTheme] is the provider for all design/theme related data.
class LoginViewTheme {
  /// You can customize the colors, text styles, elevation, borders and lots of
  /// other customizable fields implemented in this package. For the values that
  /// are indirectly used from theme, you should customize your theme.
  LoginViewTheme({
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
    this.dialogTheme,
    this.titleDescriptionSpace,
    this.spacingWithoutSocial,
    this.spacingFormAndAction,
    this.forgotPasswordPadding,
    this.actionAndChangeActionSpacing,
    this.logoPadding,
    this.socialHighlightColor,
    this.inputPadding,
    this.loadingButtonSize,
    this.showLoadingButton = true,
    this.showLoadingSocialButton = true,
    this.loadingButtonColor,
    this.loadingSocialButtonColor,
    this.titlePadding,
    this.descriptionPadding,
    this.changeActionPadding,
    this.changeActionButtonPadding,
    this.useEmailPadding,
    this.socialLoginPadding,
    this.formTitlePadding,
    this.actionButtonPadding,
    this.privacyPolicyStyle,
    this.privacyPolicyLinkStyle,
    this.checkColor,
    this.borderColor,
    this.fillColor,
    this.animatedComponentOrder = const <AnimatedComponent>[
      AnimatedComponent(
          component: LoginComponents.logo, animationType: AnimationType.left),
      AnimatedComponent(
          component: LoginComponents.title, animationType: AnimationType.left),
      AnimatedComponent(
          component: LoginComponents.description,
          animationType: AnimationType.left),
      AnimatedComponent(
          component: LoginComponents.formTitle,
          animationType: AnimationType.left),
      AnimatedComponent(component: LoginComponents.socialLogins),
      AnimatedComponent(component: LoginComponents.useEmail),
      AnimatedComponent(component: LoginComponents.form),
      AnimatedComponent(component: LoginComponents.notHaveAnAccount),
      AnimatedComponent(
          component: LoginComponents.forgotPassword,
          animationType: AnimationType.left),
      AnimatedComponent(
          component: LoginComponents.changeActionButton,
          animationType: AnimationType.left),
      AnimatedComponent(component: LoginComponents.policyCheckbox),
      AnimatedComponent(
          component: LoginComponents.actionButton,
          animationType: AnimationType.left),
    ],
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

  /// Text style for privacy policy text.
  final TextStyle? privacyPolicyStyle;

  /// Text style for privacy policy link.
  final TextStyle? privacyPolicyLinkStyle;

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

  /// Check color for the checkbox
  final Color? checkColor;

  /// Border color for the checkbox
  final Color? borderColor;

  /// Fill color for the checkbox
  final Color? fillColor;

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

  /// Padding around the form elements.
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

  /// Theme preferences for dialogs.
  final AnimatedDialogTheme? dialogTheme;

  /// Spacing between the title and description.
  final double? titleDescriptionSpace;

  /// Spacing between the form and titles without social login.
  final double? spacingWithoutSocial;

  /// Spacing between the form and action button.
  final double? spacingFormAndAction;

  /// Padding for the forgot password text.
  final EdgeInsets? forgotPasswordPadding;

  /// Spacing between action button and change action CTA.
  final double? actionAndChangeActionSpacing;

  /// Padding for the logo.
  final EdgeInsets? logoPadding;

  /// Highlight color for the social login options.
  final Color? socialHighlightColor;

  /// Custom input padding for the text form fields.
  final EdgeInsets? inputPadding;

  /// Size of the loading indicator inside the button.
  final double? loadingButtonSize;

  /// Determines whether to show loading indicator on buttons.
  final bool showLoadingButton;

  /// Determines whether to show loading indicator on social login buttons.
  final bool showLoadingSocialButton;

  /// Color of the loading indicator on a button.
  final Color? loadingButtonColor;

  /// Color of the loading indicator on a social login button.
  final Color? loadingSocialButtonColor;

  /// Custom padding around the title.
  final EdgeInsets? titlePadding;

  /// Custom padding around the description.
  final EdgeInsets? descriptionPadding;

  /// Padding around the change action CTA.
  final EdgeInsets? changeActionPadding;

  /// Padding around the change action button.
  final EdgeInsets? changeActionButtonPadding;

  /// Padding around the use email text.
  final EdgeInsets? useEmailPadding;

  /// Padding around the social login options.
  final EdgeInsets? socialLoginPadding;

  /// Padding around the form title.
  final EdgeInsets? formTitlePadding;

  /// Padding around the action button.
  final EdgeInsets? actionButtonPadding;

  /// Order of the screen components.
  final List<AnimatedComponent> animatedComponentOrder;

  /// Creates a copy login view theme with the given properties.
  LoginViewTheme copyWith({
    TextStyle? formTitleStyle,
    TextStyle? welcomeTitleStyle,
    TextStyle? welcomeDescriptionStyle,
    TextStyle? changeActionTextStyle,
    TextStyle? useEmailStyle,
    TextStyle? forgotPasswordStyle,
    TextStyle? hintTextStyle,
    TextStyle? errorTextStyle,
    TextStyle? textFormStyle,
    TextStyle? privacyPolicyStyle,
    TextStyle? privacyPolicyLinkStyle,
    InputDecoration? textFormFieldDeco,
    Widget? nameIcon,
    Widget? emailIcon,
    Widget? passwordIcon,
    double? formFieldElevation,
    Color? formFieldBackgroundColor,
    Color? formFieldShadowColor,
    BorderRadius? formFieldBorderRadius,
    Size? formFieldSize,
    Color? formFieldHoverColor,
    Color? backgroundColor,
    Color? errorBorderColor,
    Color? focusedErrorBorderColor,
    Color? enabledBorderColor,
    Color? focusedBorderColor,
    InputBorder? errorBorder,
    InputBorder? enabledBorder,
    InputBorder? focusedBorder,
    InputBorder? focusedErrorBorder,
    bool showLabelTexts = true,
    Color? socialLoginHoverColor,
    BorderSide? socialLoginBorder,
    ButtonStyle? changeLangButtonStyle,
    Color? changeLangContentColor,
    TextStyle? changeLangButtonTextStyle,
    ButtonStyle? actionButtonStyle,
    ButtonStyle? changeActionButtonStyle,
    Curve animationCurve = const Cubic(0.85, 0.40, 0.40, 0.85),
    double formWidthRatio = 60,
    Duration? animationDuration,
    double? formElementsSpacing,
    EdgeInsets? formPadding,
    Size? logoSize,
    double? socialLoginsSpacing,
    EdgeInsets? welcomePadding,
    AnimatedDialogTheme? dialogTheme,
    double? titleDescriptionSpace,
    double? spacingWithoutSocial,
    double? spacingFormAndAction,
    EdgeInsets? forgotPasswordPadding,
    double? actionAndChangeActionSpacing,
    EdgeInsets? logoPadding,
    Color? socialHighlightColor,
    EdgeInsets? inputPadding,
    double? loadingButtonSize,
    bool? showLoadingButton,
    bool? showLoadingSocialButton,
    Color? loadingButtonColor,
    Color? loadingSocialButtonColor,
    Color? checkColor,
    Color? borderColor,
    Color? fillColor,
    EdgeInsets? titlePadding,
    EdgeInsets? descriptionPadding,
    EdgeInsets? changeActionPadding,
    EdgeInsets? changeActionButtonPadding,
    EdgeInsets? useEmailPadding,
    EdgeInsets? socialLoginPadding,
    EdgeInsets? formTitlePadding,
    EdgeInsets? actionButtonPadding,
    List<AnimatedComponent>? animatedComponentOrder,
  }) =>
      LoginViewTheme(
        formTitleStyle: formTitleStyle ?? this.formTitleStyle,
        welcomeTitleStyle: welcomeTitleStyle ?? this.welcomeTitleStyle,
        welcomeDescriptionStyle:
            welcomeDescriptionStyle ?? this.welcomeDescriptionStyle,
        changeActionTextStyle:
            changeActionTextStyle ?? this.changeActionTextStyle,
        useEmailStyle: useEmailStyle ?? this.useEmailStyle,
        forgotPasswordStyle: forgotPasswordStyle ?? this.forgotPasswordStyle,
        hintTextStyle: hintTextStyle ?? this.hintTextStyle,
        errorTextStyle: errorTextStyle ?? this.errorTextStyle,
        textFormStyle: textFormStyle ?? this.textFormStyle,
        textFormFieldDeco: textFormFieldDeco ?? this.textFormFieldDeco,
        nameIcon: nameIcon ?? this.nameIcon,
        emailIcon: emailIcon ?? this.emailIcon,
        passwordIcon: passwordIcon ?? this.passwordIcon,
        formFieldElevation: formFieldElevation ?? this.formFieldElevation,
        formFieldBackgroundColor:
            formFieldBackgroundColor ?? this.formFieldBackgroundColor,
        formFieldShadowColor: formFieldShadowColor ?? this.formFieldShadowColor,
        formFieldBorderRadius:
            formFieldBorderRadius ?? this.formFieldBorderRadius,
        formFieldSize: formFieldSize ?? this.formFieldSize,
        formFieldHoverColor: formFieldHoverColor ?? this.formFieldHoverColor,
        backgroundColor: backgroundColor ?? this.backgroundColor,
        errorBorderColor: errorBorderColor ?? this.errorBorderColor,
        focusedErrorBorderColor:
            focusedErrorBorderColor ?? this.focusedErrorBorderColor,
        enabledBorderColor: enabledBorderColor ?? this.enabledBorderColor,
        focusedBorderColor: focusedBorderColor ?? this.focusedBorderColor,
        errorBorder: errorBorder ?? this.errorBorder,
        enabledBorder: enabledBorder ?? this.enabledBorder,
        focusedBorder: focusedBorder ?? this.focusedBorder,
        focusedErrorBorder: focusedErrorBorder ?? this.focusedErrorBorder,
        showLabelTexts: showLabelTexts,
        socialLoginHoverColor:
            socialLoginHoverColor ?? this.socialLoginHoverColor,
        socialLoginBorder: socialLoginBorder ?? this.socialLoginBorder,
        changeLangButtonStyle:
            changeLangButtonStyle ?? this.changeLangButtonStyle,
        changeLangContentColor:
            changeLangContentColor ?? this.changeLangContentColor,
        changeLangButtonTextStyle:
            changeLangButtonTextStyle ?? this.changeLangButtonTextStyle,
        actionButtonStyle: actionButtonStyle ?? this.actionButtonStyle,
        changeActionButtonStyle:
            changeActionButtonStyle ?? this.changeActionButtonStyle,
        animationCurve: animationCurve,
        formWidthRatio: formWidthRatio,
        animationDuration: animationDuration ?? this.animationDuration,
        formElementsSpacing: formElementsSpacing ?? this.formElementsSpacing,
        formPadding: formPadding ?? this.formPadding,
        logoSize: logoSize ?? this.logoSize,
        socialLoginsSpacing: socialLoginsSpacing ?? this.socialLoginsSpacing,
        welcomePadding: welcomePadding ?? this.welcomePadding,
        dialogTheme: dialogTheme ?? this.dialogTheme,
        titleDescriptionSpace:
            titleDescriptionSpace ?? this.titleDescriptionSpace,
        spacingFormAndAction: spacingFormAndAction ?? this.spacingFormAndAction,
        spacingWithoutSocial: spacingWithoutSocial ?? this.spacingWithoutSocial,
        forgotPasswordPadding:
            forgotPasswordPadding ?? this.forgotPasswordPadding,
        actionAndChangeActionSpacing:
            actionAndChangeActionSpacing ?? this.actionAndChangeActionSpacing,
        logoPadding: logoPadding ?? this.logoPadding,
        socialHighlightColor: socialHighlightColor ?? this.socialHighlightColor,
        inputPadding: inputPadding ?? this.inputPadding,
        loadingButtonSize: loadingButtonSize ?? this.loadingButtonSize,
        showLoadingButton: showLoadingButton ?? this.showLoadingButton,
        showLoadingSocialButton:
            showLoadingSocialButton ?? this.showLoadingSocialButton,
        loadingButtonColor: loadingButtonColor ?? this.loadingButtonColor,
        loadingSocialButtonColor:
            loadingSocialButtonColor ?? this.loadingSocialButtonColor,
        titlePadding: titlePadding ?? this.titlePadding,
        descriptionPadding: descriptionPadding ?? this.descriptionPadding,
        changeActionPadding: changeActionPadding ?? this.changeActionPadding,
        changeActionButtonPadding:
            changeActionButtonPadding ?? this.changeActionButtonPadding,
        useEmailPadding: useEmailPadding ?? this.useEmailPadding,
        socialLoginPadding: socialLoginPadding ?? this.socialLoginPadding,
        formTitlePadding: formTitlePadding ?? this.formTitlePadding,
        actionButtonPadding: actionButtonPadding ?? this.actionButtonPadding,
        animatedComponentOrder:
            animatedComponentOrder ?? this.animatedComponentOrder,
        privacyPolicyStyle: privacyPolicyStyle ?? this.privacyPolicyStyle,
        privacyPolicyLinkStyle:
            privacyPolicyLinkStyle ?? this.privacyPolicyLinkStyle,
        checkColor: checkColor ?? this.checkColor,
        borderColor: borderColor ?? this.borderColor,
        fillColor: fillColor ?? this.fillColor,
      );
}
