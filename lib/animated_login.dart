library animated_login;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/constants/curve/custom_curves.dart';
import 'src/constants/enums/sign_up_modes.dart';
import 'src/models/social_login.dart';
import 'src/providers/providers_shelf.dart';
import 'src/widgets/form_part.dart';
import 'src/widgets/welcome_part.dart';

export './src/constants/enums/sign_up_modes.dart';
export './src/models/models_shelf.dart';
export './src/providers/providers_shelf.dart';

class AnimatedLogin extends StatefulWidget {
  const AnimatedLogin({
    this.loginTheme,
    this.loginTexts,
    this.socialLogins,
    this.onLogin,
    this.onSignup,
    this.onForgotPassword,
    this.animationCurve = CustomCurves.animationCurve,
    this.formWidthRatio = 60,
    this.animationDuration = const Duration(milliseconds: 400),
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
    this.signUpMode = SignUpModes.both,
    Key? key,
  }) : super(key: key);

  final LoginTheme? loginTheme;
  final LoginTexts? loginTexts;
  final List<SocialLogin>? socialLogins;
  final LoginCallback? onLogin;
  final SignupCallback? onSignup;
  final ForgotPasswordCallback? onForgotPassword;
  final Curve animationCurve;
  final double formWidthRatio;
  final Duration animationDuration;
  final GlobalKey<FormState>? formKey;
  final double? formElementsSpacing;
  final double? socialLoginsSpacing;
  final bool checkError;
  final bool showForgotPassword;
  final bool showChangeActionTitle;
  final bool showPasswordVisibility;
  final TextEditingController? nameController;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final TextEditingController? confirmPasswordController;
  final ButtonStyle? actionButtonStyle;
  final ButtonStyle? changeActionButtonStyle;
  final EdgeInsets? welcomeHorizontalPadding;
  final EdgeInsets? formHorizontalPadding;
  final String? backgroundImage;
  final SignUpModes signUpMode;

  @override
  _AnimatedLoginState createState() => _AnimatedLoginState();
}

class _AnimatedLoginState extends State<AnimatedLogin>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late ThemeData theme;
  late Color backgroundColor =
      widget.loginTheme?.backgroundColor ?? theme.primaryColor.withOpacity(.8);

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
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return MultiProvider(
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
  }

  Widget get _stack => Stack(
        children: <Widget>[
          if (widget.backgroundImage != null)
            Image.asset(widget.backgroundImage!, fit: BoxFit.fill),
          Container(color: backgroundColor),
          WelcomePart(
            backgroundColor: backgroundColor,
            animationController: animationController,
            loginTheme: widget.loginTheme ?? LoginTheme(),
            loginTexts: widget.loginTexts ?? LoginTexts(),
            animationCurve: widget.animationCurve,
            formWidthRatio: widget.formWidthRatio,
            showChangeActionTitle: widget.showChangeActionTitle,
            changeActionButtonStyle: widget.changeActionButtonStyle,
            welcomeHorizontalPadding: widget.welcomeHorizontalPadding,
            animate: animate,
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

  void animate(BuildContext localContext) {
    animationController.isCompleted
        ? animationController.reverse()
        : animationController.forward();
    Provider.of<Auth>(localContext, listen: false).switchAuth();
  }
}
