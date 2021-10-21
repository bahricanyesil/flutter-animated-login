library animated_login;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/constants/enums/sign_up_modes.dart';
import 'src/models/social_login.dart';
import 'src/providers/providers_shelf.dart';
import 'src/widgets/form_part.dart';
import 'src/widgets/welcome_part.dart';

export './src/constants/enums/sign_up_modes.dart';
export './src/models/models_shelf.dart';
export './src/providers/providers_shelf.dart';

/// Main widget creates the animated login screen
/// by using [FormPart] and [WelcomePart] in a stack.
class AnimatedLogin extends StatefulWidget {
  const AnimatedLogin({
    this.loginTheme,
    this.loginTexts,
    this.socialLogins,
    this.onLogin,
    this.onSignup,
    this.onForgotPassword,
    this.animationCurve = const Cubic(0.85, 0.40, 0.40, 0.85),
    this.formWidthRatio = 60,
    this.animationDuration = const Duration(milliseconds: 600),
    this.formKey,
    this.formElementsSpacing,
    this.socialLoginsSpacing,
    this.checkError = true,
    this.showForgotPassword = true,
    this.showChangeActionTitle = true,
    this.showPasswordVisibility = true,
    this.nameController,
    this.emailController,
    this.passwordController,
    this.confirmPasswordController,
    this.actionButtonStyle,
    this.changeActionButtonStyle,
    this.welcomeHorizontalPadding,
    this.formHorizontalPadding,
    this.backgroundImage,
    this.logo,
    this.logoSize,
    this.signUpMode = SignUpModes.both,
    Key? key,
  }) : super(key: key);

  /// Custom LoginTheme data, colors and styles on the screen.
  final LoginTheme? loginTheme;

  /// Custom LoginTexts data, texts on the screen.
  final LoginTexts? loginTexts;

  /// List of social login options that will be provided.
  final List<SocialLogin>? socialLogins;

  /// Login callback that will be called after login button pressed.
  final LoginCallback? onLogin;

  /// Signup callback that will be called after signup button pressed.
  final SignupCallback? onSignup;

  /// Callback that will be called after on tap of forgot password text.
  final ForgotPasswordCallback? onForgotPassword;

  /// Custom animation curve that will be used for animations.
  final Curve animationCurve;

  /// Ratio of width of the form to the width of the screen.
  final double formWidthRatio;

  /// The duration of the animations.
  final Duration animationDuration;

  /// The optional custom form key, if not provided will be created locally.
  final GlobalKey<FormState>? formKey;

  /// The spacing between the elements of form.
  final double? formElementsSpacing;

  /// The spacing between the social login options.
  final double? socialLoginsSpacing;

  /// Indicates whether the login screen should handle errors,
  /// show error messages returned from the in a dialog.
  final bool checkError;

  /// Indicates whether the forgot password option will be enabled.
  final bool showForgotPassword;

  /// Indicates whether the change action title should be displayed.
  final bool showChangeActionTitle;

  /// Indicates whether the user can show the password text without obscuring.
  final bool showPasswordVisibility;

  /// Optional TextEditingController for name input field.
  final TextEditingController? nameController;

  /// Optional TextEditingController for email input field.
  final TextEditingController? emailController;

  /// Optional TextEditingController for password input field.
  final TextEditingController? passwordController;

  /// Optional TextEditingController for confirm password input field.
  final TextEditingController? confirmPasswordController;

  /// Custom button style for action button (login/signup).
  final ButtonStyle? actionButtonStyle;

  /// Custom button style for change action button that will switch auth mode.
  final ButtonStyle? changeActionButtonStyle;

  /// Horizontal padding of the welcome part widget.
  final EdgeInsets? welcomeHorizontalPadding;

  /// Horizontal padding of the form part widget.
  final EdgeInsets? formHorizontalPadding;

  /// Full asset image path for background of the welcome part.
  final String? backgroundImage;

  /// Full asset image path for the logo.
  final String? logo;

  /// Size of the logo in the welcome part
  final Size? logoSize;

  /// Enum to determine which text form fields should be displayed in addition
  /// to the email and password fields: Name / Confirm Password / Both
  final SignUpModes signUpMode;

  @override
  _AnimatedLoginState createState() => _AnimatedLoginState();
}

class _AnimatedLoginState extends State<AnimatedLogin>
    with SingleTickerProviderStateMixin {
  /// Main animation controller for the transition animations.
  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: <ChangeNotifierProvider<dynamic>>[
          ChangeNotifierProvider<LoginTexts>.value(
            value: widget.loginTexts ?? LoginTexts(),
          ),
          ChangeNotifierProvider<LoginTheme>.value(
            value: widget.loginTheme ?? LoginTheme(),
          ),
          ChangeNotifierProvider<Auth>(
            create: (BuildContext context) => Auth(
              onLogin: widget.onLogin,
              onSignup: widget.onSignup,
              onForgotPassword: widget.onForgotPassword,
              socialLogins: widget.socialLogins,
            ),
          ),
        ],
        child: Scaffold(
          body: SafeArea(
            child: AnimatedBuilder(
              animation: animationController,
              builder: (_, __) => _stack,
            ),
          ),
        ),
      );

  Widget get _stack {
    final Color backgroundColor = widget.loginTheme?.backgroundColor ??
        Theme.of(context).primaryColor.withOpacity(.8);
    return Stack(
      children: <Widget>[
        Container(color: backgroundColor),
        WelcomePart(
          backgroundColor: backgroundColor,
          backgroundImage: widget.backgroundImage,
          animationController: animationController,
          loginTheme: widget.loginTheme ?? LoginTheme(),
          loginTexts: widget.loginTexts ?? LoginTexts(),
          logo: widget.logo,
          logoSize: widget.logoSize,
          animationCurve: widget.animationCurve,
          formWidthRatio: widget.formWidthRatio,
          showChangeActionTitle: widget.showChangeActionTitle,
          changeActionButtonStyle: widget.changeActionButtonStyle,
          welcomeHorizontalPadding: widget.welcomeHorizontalPadding,
        ),
        FormPart(
          backgroundColor: backgroundColor,
          animationController: animationController,
          loginTheme: widget.loginTheme ?? LoginTheme(),
          loginTexts: widget.loginTexts ?? LoginTexts(),
          formWidthRatio: widget.formWidthRatio,
          animationCurve: widget.animationCurve,
          formKey: widget.formKey,
          formElementsSpacing: widget.formElementsSpacing,
          socialLoginsSpacing: widget.socialLoginsSpacing,
          checkError: widget.checkError,
          showForgotPassword: widget.showForgotPassword,
          actionButtonStyle: widget.actionButtonStyle,
          formHorizontalPadding: widget.formHorizontalPadding,
          showPasswordVisibility: widget.showPasswordVisibility,
          nameController: widget.nameController,
          emailController: widget.emailController,
          passwordController: widget.passwordController,
          confirmPasswordController: widget.confirmPasswordController,
          signUpMode: widget.signUpMode,
        ),
      ],
    );
  }
}
