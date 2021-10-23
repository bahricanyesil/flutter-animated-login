import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/enums/sign_up_modes.dart';
import '../decorations/text_styles.dart';
import '../models/models_shelf.dart';
import '../providers/providers_shelf.dart';
import '../responsiveness/dynamic_size.dart';
import '../utils/animation_helper.dart';
import '../utils/validators.dart';
import '../widgets/widgets_shelf.dart';
import 'dialogs/dialog_builder.dart';

class FormPart extends StatefulWidget {
  const FormPart({
    required this.backgroundColor,
    required this.animationController,
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
  /// Custom LoginTheme data, colors and styles on the screen.
  late final LoginTheme loginTheme = context.read<LoginTheme>();

  /// Custom LoginTexts data, texts on the screen.
  late final LoginTexts loginTexts = context.read<LoginTexts>();

  /// It is for giving responsive size values.
  late DynamicSize dynamicSize;

  /// Its aim is to take, manage, change auth data with the state.
  late Auth auth;

  /// Theme is created as a variable to call it from different code pieces.
  late ThemeData theme;

  /// Transition animation that will change the location of the form part.
  late Animation<double> transitionAnimation;

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

  /// Checks whether the animation has passed the middle point.
  bool isReverse = true;

  late final bool isLandscape = context.read<LoginTheme>().isLandscape;

  @override
  void initState() {
    super.initState();

    /// Initializes the appearance and disappearance animations
    /// from outside to the screen for the form components.
    offsetAnimation = AnimationHelper(
      animationController: widget.animationController,
      animationCurve: widget.animationCurve,
    ).tweenSequenceAnimation(80, 10);

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
    _initializeAnimations();
    return isLandscape
        ? _webView
        : Transform.translate(
            offset: Offset(dynamicSize.width * transitionAnimation.value, 0),
            child: _formColumn,
          );
  }

  Widget get _webView => Transform.translate(
        offset: Offset(dynamicSize.width * transitionAnimation.value, 0),
        child: Container(
          width: dynamicSize.width * widget.formWidthRatio,
          height: dynamicSize.height * 100,
          color: Colors.white,
          child: Transform.translate(
            offset: Offset(dynamicSize.width * offsetAnimation.value, 0),
            child: _formColumn,
          ),
        ),
      );

  Widget get _formColumn => Padding(
        padding:
            widget.formHorizontalPadding ?? dynamicSize.highHorizontalPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (isLandscape) _formTitle,
            if (auth.socialLogins != null && auth.socialLogins!.isNotEmpty)
              ..._socialLoginPart
            else
              SizedBox(height: dynamicSize.height * 6),
            _form,
            SizedBox(height: dynamicSize.height * (isLandscape ? 4 : 3)),
            _actionButton,
          ],
        ),
      );

  List<Widget> get _socialLoginPart => <Widget>[
        SizedBox(height: dynamicSize.height * 2.5),
        _socialLoginOptions,
        SizedBox(height: dynamicSize.height * 2),
        _useEmailText,
        SizedBox(height: dynamicSize.height * 1.8),
      ];

  Widget get _formTitle => BaseText(
        isReverse ? loginTexts.loginFormTitle : loginTexts.signUpFormTitle,
        style: TextStyles(context)
            .titleStyle(color: isLandscape ? null : Colors.white)
            .merge(loginTheme.formTitleStyle),
      );

  Widget get _socialLoginOptions => Wrap(
        spacing: widget.socialLoginsSpacing ?? dynamicSize.responsiveSize * 10,
        alignment: WrapAlignment.center,
        children: _socialLoginButtons,
      );

  Widget get _useEmailText => BaseText(
        isReverse ? loginTexts.loginUseEmail : loginTexts.signUpUseEmail,
        style: TextStyles(context)
            .subtitleTextStyle(
                color: isLandscape ? Colors.black87 : Colors.white)
            .merge(loginTheme.useEmailStyle),
      );

  List<Widget> get _socialLoginButtons => List<Widget>.generate(
        auth.socialLogins!.length,
        (int index) => CircleWidget(
          onTap: () async => _socialLoginCallback(index),
          color: isLandscape ? null : Colors.white,
          widthFactor: isLandscape ? 13 : 16,
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
        buttonText: isReverse ? loginTexts.login : loginTexts.signUp,
        onPressed: _action,
        backgroundColor: isLandscape
            ? theme.primaryColor.withOpacity(.8)
            : Colors.white.withOpacity(.9),
        buttonStyle: widget.actionButtonStyle,
        textStyle: loginTheme.actionTextStyle,
      );

  Future<void> _action() async {
    FocusScope.of(context).unfocus();
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
      return loginTexts.passwordMatchingError;
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
          spacing: widget.formElementsSpacing ??
              dynamicSize.height * (isLandscape ? 2.2 : 1.8),
          children: _formElements,
        ),
      );

  List<Widget> get _formElements => <Widget>[
        if (!isReverse && widget.signUpMode != SignUpModes.confirmPassword)
          CustomTextFormField(
            controller: nameController,
            hintText: loginTexts.nameHint,
            prefixIcon: Icons.person_outline,
            prefixWidget: loginTheme.nameIcon,
            validator: Validators.name,
            textInputAction: TextInputAction.next,
          ),
        CustomTextFormField(
          controller: emailController,
          hintText: loginTexts.emailHint,
          prefixIcon: Icons.email_outlined,
          prefixWidget: loginTheme.emailIcon,
          validator: Validators.email,
          textInputAction: TextInputAction.next,
        ),
        ObscuredTextFormField(
          controller: passwordController,
          hintText: loginTexts.passwordHint,
          prefixIcon: Icons.password_outlined,
          showPasswordVisibility: widget.showPasswordVisibility,
          textInputAction:
              auth.isSignup ? TextInputAction.next : TextInputAction.done,
          onFieldSubmitted: auth.isSignup ? null : (_) => _action(),
        ),
        if (!isReverse && widget.signUpMode != SignUpModes.name)
          ObscuredTextFormField(
            controller: confirmPasswordController,
            hintText: loginTexts.confirmPasswordHint,
            prefixIcon: Icons.password_outlined,
            showPasswordVisibility: widget.showPasswordVisibility,
            onFieldSubmitted: (_) => _action(),
          ),
        if (isReverse && widget.showForgotPassword) _forgotPassword,
      ];

  Widget get _forgotPassword => Container(
        alignment: isLandscape ? Alignment.center : Alignment.topCenter,
        padding: isLandscape
            ? dynamicSize.lowTopPadding
            : dynamicSize.lowMedBottomPadding,
        child: BaseTextButton(
          text: loginTexts.forgotPassword,
          style: _defaultStyle
              .copyWith(decoration: TextDecoration.underline)
              .merge(loginTheme.forgotPasswordStyle),
          onPressed: () async {
            await _errorCheck(_forgotPasswordResult);
          },
        ),
      );

  TextStyle get _defaultStyle => TextStyles(context)
      .subBodyStyle(color: isLandscape ? theme.primaryColor : Colors.white);

  Future<String?> _forgotPasswordResult() async =>
      auth.onForgotPassword(emailController.text);

  void _initializeAnimations() {
    /// Initializes the transition animation from welcome part's width ratio
    /// to 0 with custom animation curve and animation controller.
    transitionAnimation = isLandscape
        ? Tween<double>(begin: 100 - widget.formWidthRatio, end: 0).animate(
            CurvedAnimation(
              parent: widget.animationController,
              curve: widget.animationCurve,
            ),
          )
        : AnimationHelper(
            animationController: widget.animationController,
            animationCurve: widget.animationCurve,
          ).tweenSequenceAnimation(120, 20);

    transitionAnimation.addListener(() {
      if (isLandscape) {
        isReverse =
            transitionAnimation.value >= (100 - widget.formWidthRatio) / 2;
      } else if (_forwardCheck) {
        isReverse = !isReverse;
      }
    });
  }

  bool get _forwardCheck => isLandscape
      ? transitionAnimation.value >= (100 - widget.formWidthRatio) / 2
      : transitionAnimation.value >= 100 && _statusCheck;

  bool get _statusCheck =>
      (transitionAnimation.status == AnimationStatus.forward && isReverse) ||
      (transitionAnimation.status == AnimationStatus.reverse && !isReverse);
}
