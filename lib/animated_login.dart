library animated_login;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/constants/enums/sign_up_modes.dart';
import 'src/models/social_login.dart';
import 'src/providers/providers_shelf.dart';
import 'src/responsiveness/dynamic_size.dart';
import 'src/widgets/form_part.dart';
import 'src/widgets/welcome_components.dart';

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
  /// Dynamic size object to give responsive size values.
  late final DynamicSize dynamicSize;

  /// Main animation controller for the transition animations.
  late final AnimationController animationController;

  /// Background color of the welcome part.
  late Color backgroundColor;

  /// Transition animation that will change the location of the welcome part.
  late final Animation<double> welcomeTransitionAnimation;

  /// Custom LoginTheme data, colors and styles on the screen.
  late final LoginTheme loginTheme;

  /// Custom LoginTexts data, texts on the screen.
  late final LoginTexts loginTexts;

  // TODO(bahrican):
  bool isWeb = false;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    /// Initializes the transition animation from 0 to form part's width ratio
    /// with custom animation curve and animation controller.
    welcomeTransitionAnimation =
        Tween<double>(begin: 0, end: widget.formWidthRatio).animate(
      CurvedAnimation(
        parent: animationController,
        curve: widget.animationCurve,
      ),
    );

    loginTexts = widget.loginTexts ?? LoginTexts();
    loginTheme = widget.loginTheme ?? LoginTheme();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    backgroundColor = widget.loginTheme?.backgroundColor ??
        Theme.of(context).primaryColor.withOpacity(.8);
    return MultiProvider(
      providers: <ChangeNotifierProvider<dynamic>>[
        ChangeNotifierProvider<LoginTexts>.value(
          value: loginTexts,
        ),
        ChangeNotifierProvider<LoginTheme>.value(
          value: loginTheme,
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
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: AnimatedBuilder(
            animation: animationController,
            builder: (_, __) => isWeb ? _webView : _mobileView,
          ),
        ),
      ),
    );
  }

  Widget get _webView => Stack(
        children: <Widget>[
          Container(color: backgroundColor),
          _animatedWebWelcome,
          _formPart,
        ],
      );

  Widget get _mobileView {
    final DynamicSize dynamicSize = DynamicSize(context);
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(
        vertical: dynamicSize.height * 4,
        horizontal: dynamicSize.width * 7,
      ),
      children: <Widget>[
        _logoAndTexts,
        _formPart,
      ],
    );
  }

  Widget get _animatedWebWelcome => Transform.translate(
        offset: Offset(dynamicSize.width * welcomeTransitionAnimation.value, 0),
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            image: widget.backgroundImage == null
                ? null
                : DecorationImage(
                    image: AssetImage(widget.backgroundImage!),
                    fit: BoxFit.cover,
                  ),
          ),
          width: dynamicSize.width * (100 - widget.formWidthRatio),
          height: dynamicSize.height * 100,
          child: _webWelcomeComponents(context),
        ),
      );

  Widget _webWelcomeComponents(BuildContext context) => Padding(
        padding: widget.welcomeHorizontalPadding ??
            DynamicSize(context).medHighHorizontalPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _logoAndTexts,
            _changeActionButton,
          ],
        ),
      );

  Widget get _logoAndTexts => LogoAndTexts(
        logo: widget.logo,
        logoSize: widget.logoSize,
        isForward: isForward,
        loginTexts: loginTexts,
        loginTheme: loginTheme,
      );

  Widget get _changeActionButton => ChangeActionButton(
        showChangeActionTitle: widget.showChangeActionTitle,
        isForward: isForward,
        loginTexts: loginTexts,
        loginTheme: loginTheme,
        animate: () => animate(context),
        changeActionButtonStyle: widget.changeActionButtonStyle,
      );

  Widget get _formPart => FormPart(
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
      );

  void animate(BuildContext context) {
    animationController.isCompleted
        ? animationController.reverse()
        : animationController.forward();
    Provider.of<Auth>(context, listen: false).switchAuth();
  }

  bool get isForward =>
      welcomeTransitionAnimation.value <= widget.formWidthRatio / 2;
}
