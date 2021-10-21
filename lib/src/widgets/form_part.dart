import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/enums/sign_up_modes.dart';
import '../decorations/text_styles.dart';
import '../models/models_shelf.dart';
import '../providers/providers_shelf.dart';
import '../responsiveness/dynamic_size.dart';
import '../utils/validators.dart';
import '../widgets/widgets_shelf.dart';
import 'dialogs/dialog_builder.dart';

class FormPart extends StatefulWidget {
  const FormPart({
    required this.backgroundColor,
    required this.animationController,
    required this.loginTheme,
    required this.loginTexts,
    required this.animationCurve,
    required this.formWidthRatio,
    required this.checkError,
    required this.showForgotPassword,
    required this.showPasswordVisibility,
    required this.signUpMode,
    this.formKey,
    this.formElementsSpacing,
    this.socialLoginsSpacing,
    this.nameController,
    this.emailController,
    this.passwordController,
    this.confirmPasswordController,
    this.actionButtonStyle,
    this.formHorizontalPadding,
    Key? key,
  }) : super(key: key);

  /// Background color of the whole form part.
  final Color backgroundColor;

  /// Main animation controller for the transition animation.
  final AnimationController animationController;

  /// Custom LoginTheme data, colors and styles on the screen.
  final LoginTheme loginTheme;

  /// Custom LoginTexts data, texts on the screen.
  final LoginTexts loginTexts;

  /// Custom animation curve that will be used for animations.
  final Curve animationCurve;

  /// Ratio of width of the form to the width of the screen.
  final double formWidthRatio;

  /// The optional custom form key, if not provided will be created locally.
  final GlobalKey<FormState>? formKey;

  /// The spacing between the elements of form.
  final double? formElementsSpacing;

  /// The spacing between the social login options.
  final double? socialLoginsSpacing;

  /// Indicates whether the text form fields should show error messages.
  final bool checkError;

  /// Indicates whether the forgot password option will be enabled.
  final bool showForgotPassword;

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

  /// Horizontal padding of the form part widget.
  final EdgeInsets? formHorizontalPadding;

  /// Enum to determine which text form fields should be displayed in addition
  /// to the email and password fields: Name / Confirm Password / Both
  final SignUpModes signUpMode;

  @override
  _FormPartState createState() => _FormPartState();
}

class _FormPartState extends State<FormPart> {
  /// It is for giving responsive size values.
  late DynamicSize dynamicSize;

  /// Its aim is to take, manage, change auth data with the state.
  late Auth auth;

  /// Theme is created as a variable to call it from different code pieces.
  late ThemeData theme;

  /// Transition animation that will change the location of the form part.
  late final Animation<double> transitionAnimation;

  /// Animation that will change the location of the components of form.
  late final Animation<double> offsetAnimation;

  /// Text Editing Controllers for the text form fields.
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;

  /// The form key that will be assigned to the form.
  late final GlobalKey<FormState> _formKey =
      widget.formKey ?? GlobalKey<FormState>();

  /// Controls the focus transition between the components.
  late final List<FocusNode> focusN;

  @override
  void initState() {
    super.initState();

    /// Initializes the transition animation from welcome part's width ratio
    /// to 0 with custom animation curve and animation controller.
    transitionAnimation =
        Tween<double>(begin: 100 - widget.formWidthRatio, end: 0).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: widget.animationCurve,
      ),
    );

    /// Initializes the appearance and disappearance animations
    /// from outside to the screen for the form components.
    offsetAnimation = TweenSequence<double>(
      <TweenSequenceItem<double>>[
        _tweenSequenceItem(end: 80),
        _tweenSequenceItem(begin: 80, end: 80, weight: 10),
        _tweenSequenceItem(begin: -80),
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
    confirmPasswordController =
        widget.confirmPasswordController ?? TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
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
              _formTitle,
              if (auth.socialLogins != null && auth.socialLogins!.isNotEmpty)
                ..._socialLoginPart
              else
                SizedBox(height: dynamicSize.height * 6),
              _form,
              SizedBox(height: dynamicSize.height * 4),
              _actionButton,
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
        SizedBox(height: dynamicSize.height * 3),
        _socialLoginOptions,
        SizedBox(height: dynamicSize.height * 3),
        _useEmailText,
        SizedBox(height: dynamicSize.height * 2.5),
      ];

  Widget get _formTitle => BaseText(
        isForward
            ? widget.loginTexts.loginFormTitle
            : widget.loginTexts.signUpFormTitle,
        style: TextStyles(context)
            .titleStyle()
            .merge(widget.loginTheme.formTitleStyle),
      );

  Widget get _socialLoginOptions => Wrap(
        spacing: widget.socialLoginsSpacing ?? dynamicSize.responsiveSize * 10,
        alignment: WrapAlignment.center,
        children: _socialLoginButtons,
      );

  Widget get _useEmailText => BaseText(
        isForward
            ? widget.loginTexts.loginUseEmail
            : widget.loginTexts.signUpUseEmail,
        style: TextStyles(context)
            .subtitleTextStyle(color: Colors.black87)
            .merge(widget.loginTheme.useEmailStyle),
      );

  List<Widget> get _socialLoginButtons => List<Widget>.generate(
        auth.socialLogins!.length,
        (int index) => CircleWidget(
          onTap: () async => _socialLoginCallback(index),
          child: Image.asset(auth.socialLogins![index].iconPath),
        ),
      );

  Future<void> _socialLoginCallback(int index) async {
    if (widget.checkError) {
      await _errorCheck(auth.socialLogins![index].callback);
    } else {
      await auth.socialLogins![index].callback();
    }
  }

  Widget get _actionButton => RoundedButton(
        buttonText:
            isForward ? widget.loginTexts.login : widget.loginTexts.signUp,
        onPressed: _action,
        backgroundColor: theme.primaryColor.withOpacity(.8),
        buttonStyle: widget.actionButtonStyle,
        textStyle: widget.loginTheme.actionTextStyle,
      );

  Future<void> _action() async {
    if (_formKey.currentState!.validate()) {
      if (auth.isLogin) {
        await _errorCheck(_loginResult);
      } else if (auth.isSignup) {
        await _errorCheck(_signupResult);
      }
    }
  }

  Future<void> _errorCheck(Future<String?> Function() action) async {
    final String? errorMessage = await action();
    if (errorMessage != null && widget.checkError) {
      DialogBuilders(context).showErrorDialog(errorMessage);
    }
  }

  Future<String?> _loginResult() async {
    final LoginData loginData = LoginData(
      email: emailController.text,
      password: passwordController.text,
    );
    return auth.onLogin(loginData);
  }

  Future<String?> _signupResult() async {
    final SignUpData signupData = SignUpData(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
    );
    if (signupData.password != signupData.confirmPassword &&
        widget.checkError &&
        widget.signUpMode != SignUpModes.name) {
      return widget.loginTexts.passwordMatchingError;
    } else {
      return auth.onSignup(signupData);
    }
  }

  Form get _form => Form(
        key: _formKey,
        child: Wrap(
          direction: Axis.vertical,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: widget.formElementsSpacing ?? dynamicSize.height * 2.2,
          children: _formElements,
        ),
      );

  List<Widget> get _formElements => <Widget>[
        if (!isForward && widget.signUpMode != SignUpModes.confirmPassword)
          CustomTextFormField(
            controller: nameController,
            hintText: widget.loginTexts.nameHint,
            prefixIcon: Icons.person_outline,
            prefixWidget: widget.loginTheme.nameIcon,
            validator: Validators.name,
            textInputAction: TextInputAction.next,
          ),
        CustomTextFormField(
          controller: emailController,
          hintText: widget.loginTexts.emailHint,
          prefixIcon: Icons.email_outlined,
          prefixWidget: widget.loginTheme.emailIcon,
          validator: Validators.email,
          textInputAction: TextInputAction.next,
        ),
        ObscuredTextFormField(
          controller: passwordController,
          hintText: widget.loginTexts.passwordHint,
          prefixIcon: Icons.password_outlined,
          showPasswordVisibility: widget.showPasswordVisibility,
          textInputAction: TextInputAction.next,
        ),
        if (!isForward && widget.signUpMode != SignUpModes.name)
          ObscuredTextFormField(
            controller: confirmPasswordController,
            hintText: widget.loginTexts.confirmPasswordHint,
            prefixIcon: Icons.password_outlined,
            showPasswordVisibility: widget.showPasswordVisibility,
          ),
        if (isForward && widget.showForgotPassword) _forgotPassword,
      ];

  Widget get _forgotPassword => Padding(
        padding: dynamicSize.lowTopPadding,
        child: BaseTextButton(
          text: widget.loginTexts.forgotPassword,
          style: TextStyles(context)
              .subBodyStyle(color: theme.primaryColor)
              .underline
              .merge(widget.loginTheme.forgotPasswordStyle),
          onPressed: () async {
            await _errorCheck(_forgotPasswordResult);
          },
        ),
      );

  Future<String?> _forgotPasswordResult() async =>
      auth.onForgotPassword(emailController.text);

  bool get isForward =>
      transitionAnimation.value >= (100 - widget.formWidthRatio) / 2;
}
