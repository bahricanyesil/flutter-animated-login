library animated_login;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/constants/curve/custom_curves.dart';
import 'src/decorations/text_styles.dart';
import 'src/models/login_data.dart';
import 'src/models/signup_data.dart';
import 'src/models/social_login.dart';
import 'src/providers/auth.dart';
import 'src/providers/login_texts.dart';
import 'src/providers/login_theme.dart';
import 'src/responsiveness/dynamic_size.dart';
import 'src/widgets/buttons/base_text_button.dart';
import 'src/widgets/buttons/rounded_button.dart';
import 'src/widgets/shaped-widgets/circle_widget.dart';
import 'src/widgets/text-form-fields/custom_text_form_field.dart';
import 'src/widgets/text-form-fields/obscured_text_form_field.dart';
import 'src/widgets/texts/base_text.dart';
import 'src/widgets/texts/not_fitted_text.dart';

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
    this.nameController,
    this.emailController,
    this.passwordController,
    this.actionButtonStyle,
    this.changeActionButtonStyle,
    this.welcomeHorizontalPadding,
    this.formHorizontalPadding,
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
  final TextEditingController? nameController;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final ButtonStyle? actionButtonStyle;
  final ButtonStyle? changeActionButtonStyle;
  final EdgeInsets? welcomeHorizontalPadding;
  final EdgeInsets? formHorizontalPadding;

  @override
  _AnimatedLoginState createState() => _AnimatedLoginState();
}

// TODO(bahrican):
/// Background image or informing part
/// Background color - Informing/Form
/// Input validators
/// icons for text form fields
/// label texts for text fields
/// Name or confirmpassword modes
/// LoginUserType (email, username, phone)
/// All style related things
/// Label&Hint text styles
/// label option

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
          Container(color: backgroundColor),
          _WelcomePart(
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
          _FormPart(
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

class _WelcomePart extends StatefulWidget {
  const _WelcomePart({
    required this.backgroundColor,
    required this.animationController,
    required this.loginTheme,
    required this.loginTexts,
    required this.animate,
    required this.animationCurve,
    required this.formWidthRatio,
    required this.showChangeActionTitle,
    this.changeActionButtonStyle,
    this.welcomeHorizontalPadding,
    Key? key,
  }) : super(key: key);
  final Color backgroundColor;
  final AnimationController animationController;
  final LoginTheme loginTheme;
  final LoginTexts loginTexts;
  final Function(BuildContext context) animate;
  final Curve animationCurve;
  final double formWidthRatio;
  final bool showChangeActionTitle;
  final ButtonStyle? changeActionButtonStyle;
  final EdgeInsets? welcomeHorizontalPadding;

  @override
  __WelcomePartState createState() => __WelcomePartState();
}

class __WelcomePartState extends State<_WelcomePart> {
  late DynamicSize dynamicSize;
  late Auth auth;
  late ThemeData theme;
  late final Animation<double> transitionAnimation;

  @override
  void initState() {
    super.initState();
    transitionAnimation =
        Tween<double>(begin: 0, end: widget.formWidthRatio).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: widget.animationCurve,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    dynamicSize = DynamicSize(context);
    theme = Theme.of(context);
    auth = context.watch<Auth>();
    return Transform.translate(
      offset: Offset(dynamicSize.width * transitionAnimation.value, 0),
      child: Container(
        color: widget.backgroundColor,
        width: dynamicSize.width * (100 - widget.formWidthRatio),
        height: dynamicSize.height * 100,
        child: _welcomeTexts,
      ),
    );
  }

  Widget get _welcomeTexts => Padding(
        padding: widget.welcomeHorizontalPadding ??
            dynamicSize.medHighHorizontalPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: dynamicSize.height * 10),
            _title,
            SizedBox(height: dynamicSize.height * 6),
            _description,
            SizedBox(height: dynamicSize.height * 7),
            if (widget.showChangeActionTitle) _changeActionTitle,
            _changeActionButton,
            SizedBox(height: dynamicSize.height * 10),
          ],
        ),
      );

  Widget get _title => BaseText(
        isForward ? widget.loginTexts.welcomeBack : widget.loginTexts.welcome,
        style: widget.loginTheme.welcomeTitleStyle ??
            TextStyles(context).titleStyle(color: Colors.white),
      );

  Widget get _description => NotFittedText(
        isForward
            ? widget.loginTexts.welcomeBackDescription
            : widget.loginTexts.welcomeDescription,
        style: widget.loginTheme.welcomeDescriptionStyle ??
            TextStyles(context).bodyStyle(),
      );

  Widget get _changeActionTitle => Padding(
        padding: dynamicSize.lowMedBottomPadding,
        child: BaseText(
          isForward
              ? widget.loginTexts.dontHaveAnAccount
              : widget.loginTexts.alreadyHaveAnAccount,
          style: widget.loginTheme.changeActionStyle ??
              TextStyles(context).subtitleTextStyle(),
        ),
      );

  Widget get _changeActionButton => RoundedButton(
        buttonText:
            isForward ? widget.loginTexts.signUp : widget.loginTexts.login,
        onPressed: () => widget.animate(context),
        borderColor: Colors.white,
        backgroundColor: theme.primaryColor.withOpacity(.8),
        buttonStyle: widget.changeActionButtonStyle,
      );

  bool get isForward => transitionAnimation.value <= widget.formWidthRatio / 2;
}

class _FormPart extends StatefulWidget {
  const _FormPart({
    required this.backgroundColor,
    required this.animationController,
    required this.loginTheme,
    required this.loginTexts,
    required this.animationCurve,
    required this.formWidthRatio,
    required this.checkError,
    required this.showForgotPassword,
    this.socialLogins = const <SocialLogin>[],
    this.formKey,
    this.formElementsSpacing,
    this.socialLoginsSpacing,
    this.nameController,
    this.emailController,
    this.passwordController,
    this.actionButtonStyle,
    this.formHorizontalPadding,
    Key? key,
  }) : super(key: key);
  final Color backgroundColor;
  final AnimationController animationController;
  final LoginTheme loginTheme;
  final LoginTexts loginTexts;
  final List<SocialLogin> socialLogins;
  final Curve animationCurve;
  final double formWidthRatio;
  final GlobalKey<FormState>? formKey;
  final double? formElementsSpacing;
  final double? socialLoginsSpacing;
  final bool checkError;
  final bool showForgotPassword;
  final TextEditingController? nameController;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final ButtonStyle? actionButtonStyle;
  final EdgeInsets? formHorizontalPadding;

  @override
  __FormPartState createState() => __FormPartState();
}

class __FormPartState extends State<_FormPart> {
  late DynamicSize dynamicSize;
  late Auth auth;
  late ThemeData theme;
  late final Animation<double> transitionAnimation;
  late final Animation<double> offsetAnimation;
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final GlobalKey<FormState> _formKey =
      widget.formKey ?? GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    transitionAnimation =
        Tween<double>(begin: 100 - widget.formWidthRatio, end: 0).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: widget.animationCurve,
      ),
    );
    offsetAnimation = TweenSequence<double>(
      <TweenSequenceItem<double>>[
        _tweenSequenceItem(end: 50),
        _tweenSequenceItem(begin: 50, end: 50, weight: 10),
        _tweenSequenceItem(begin: -50),
      ],
    ).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: widget.animationCurve,
      ),
    );
    nameController = widget.nameController ?? TextEditingController();
    emailController = widget.emailController ?? TextEditingController();
    passwordController = widget.passwordController ?? TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dynamicSize = DynamicSize(context);
    theme = Theme.of(context);
    auth = context.watch<Auth>();
    return Transform.translate(
      offset: Offset(dynamicSize.width * transitionAnimation.value, 0),
      child: Container(
        width: dynamicSize.width * widget.formWidthRatio,
        height: dynamicSize.height * 100,
        color: Colors.white,
        child: _formColumn,
      ),
    );
  }

  Widget get _formColumn => Transform.translate(
        offset: Offset(dynamicSize.width * offsetAnimation.value, 0),
        child: Padding(
          padding:
              widget.formHorizontalPadding ?? dynamicSize.highHorizontalPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: dynamicSize.height * 10),
              _formTitle,
              if (widget.socialLogins.isNotEmpty) ..._socialLoginPart,
              SizedBox(height: dynamicSize.height * 7),
              _form,
              SizedBox(height: dynamicSize.height * 7),
              _actionButton,
              SizedBox(height: dynamicSize.height * 10),
            ],
          ),
        ),
      );

  TweenSequenceItem<double> _tweenSequenceItem({
    double begin = 0,
    double end = 0,
    double weight = 30,
  }) =>
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: begin, end: end), weight: weight);

  List<Widget> get _socialLoginPart => <Widget>[
        SizedBox(height: dynamicSize.height * 2),
        _socialLoginOptions,
        SizedBox(height: dynamicSize.height * 8),
        _useEmailText,
        SizedBox(height: dynamicSize.height * 2),
      ];

  Widget get _formTitle => BaseText(
        isForward
            ? widget.loginTexts.loginFormTitle
            : widget.loginTexts.signUpFormTitle,
        style: widget.loginTheme.formTitleStyle ??
            TextStyles(context).titleStyle(),
      );

  Widget get _socialLoginOptions => Wrap(
        spacing: widget.socialLoginsSpacing ?? dynamicSize.width * 2,
        alignment: WrapAlignment.center,
        children: _socialLoginButtons,
      );

  Widget get _useEmailText => BaseText(
        isForward
            ? widget.loginTexts.loginUseEmail
            : widget.loginTexts.signUpUseEmail,
        style: widget.loginTheme.useEmailStyle ??
            theme.textTheme.headline6!.copyWith(color: Colors.black),
      );

  List<Widget> get _socialLoginButtons => List<Widget>.generate(
        widget.socialLogins.length,
        (int index) => CircleWidget(
          onTap: widget.socialLogins[index].callback,
          child: Image.asset(widget.socialLogins[index].iconPath),
        ),
      );

  Widget get _actionButton => RoundedButton(
        buttonText:
            isForward ? widget.loginTexts.login : widget.loginTexts.signUp,
        onPressed: _action,
        backgroundColor: theme.primaryColor.withOpacity(.8),
        buttonStyle: widget.actionButtonStyle,
      );

  Future<void> _action() async {
    String? errorMessage;
    if (auth.isLogin) {
      final LoginData loginData = LoginData(
        email: emailController.text,
        password: passwordController.text,
      );
      errorMessage = await auth.onLogin(loginData);
    } else if (auth.isSignup) {
      final SignUpData signupData = SignUpData(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
      );
      errorMessage = await auth.onSignup(signupData);
    }
    if (errorMessage != null && widget.checkError) {}
  }

  Form get _form => Form(
        key: _formKey,
        child: Wrap(
          direction: Axis.vertical,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: widget.formElementsSpacing ?? dynamicSize.height * 2.1,
          children: _formElements,
        ),
      );

  List<Widget> get _formElements => <Widget>[
        if (!isForward)
          CustomTextFormField(
            controller: nameController,
            hintText: widget.loginTexts.nameHint,
            prefixIcon: Icons.person_outline,
          ),
        CustomTextFormField(
          controller: emailController,
          hintText: widget.loginTexts.emailHint,
          prefixIcon: Icons.email_outlined,
        ),
        ObscuredTextFormField(
          controller: passwordController,
          hintText: widget.loginTexts.passwordHint,
          prefixIcon: Icons.password_outlined,
        ),
        if (isForward && widget.showForgotPassword)
          Padding(
            padding: dynamicSize.lowTopPadding,
            child: BaseTextButton(
              text: widget.loginTexts.forgotPassword,
              style: widget.loginTheme.forgotPasswordStyle ??
                  TextStyles(context)
                      .subBodyStyle(color: theme.primaryColor)
                      .underline,
              onPressed: () async {
                final String? errorMessage =
                    await auth.onForgotPassword(emailController.text);
                if (errorMessage != null && widget.checkError) {}
              },
            ),
          ),
      ];

  bool get isForward =>
      transitionAnimation.value >= (100 - widget.formWidthRatio) / 2;
}
