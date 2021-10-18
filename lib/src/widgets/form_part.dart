import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/enums/sign_up_modes.dart';
import '../decorations/text_styles.dart';
import '../models/models_shelf.dart';
import '../providers/providers_shelf.dart';
import '../responsiveness/dynamic_size.dart';
import '../utils/validators.dart';
import '../widgets/widgets_shelf.dart';

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
  final Color backgroundColor;
  final AnimationController animationController;
  final LoginTheme loginTheme;
  final LoginTexts loginTexts;
  final Curve animationCurve;
  final double formWidthRatio;
  final GlobalKey<FormState>? formKey;
  final double? formElementsSpacing;
  final double? socialLoginsSpacing;
  final bool checkError;
  final bool showForgotPassword;
  final bool showPasswordVisibility;
  final TextEditingController? nameController;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final TextEditingController? confirmPasswordController;
  final ButtonStyle? actionButtonStyle;
  final EdgeInsets? formHorizontalPadding;
  final SignUpModes signUpMode;

  @override
  _FormPartState createState() => _FormPartState();
}

class _FormPartState extends State<FormPart> {
  late DynamicSize dynamicSize;
  late Auth auth;
  late ThemeData theme;
  late final Animation<double> transitionAnimation;
  late final Animation<double> offsetAnimation;
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
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
        SizedBox(height: dynamicSize.height * 4),
        _socialLoginOptions,
        SizedBox(height: dynamicSize.height * 4),
        _useEmailText,
        SizedBox(height: dynamicSize.height * 3.5),
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
          onTap: auth.socialLogins![index].callback,
          child: Image.asset(auth.socialLogins![index].iconPath),
        ),
      );

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
          confirmPassword: confirmPasswordController.text,
        );
        if (signupData.password != signupData.confirmPassword) {
          errorMessage = 'The passwords you entered do not match, check again.';
        } else {
          errorMessage = await auth.onSignup(signupData);
        }
      }
      if (errorMessage != null && widget.checkError) {}
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
          ),
        CustomTextFormField(
          controller: emailController,
          hintText: widget.loginTexts.emailHint,
          prefixIcon: Icons.email_outlined,
          prefixWidget: widget.loginTheme.emailIcon,
          validator: Validators.email,
        ),
        ObscuredTextFormField(
          controller: passwordController,
          hintText: widget.loginTexts.passwordHint,
          prefixIcon: Icons.password_outlined,
          showPasswordVisibility: widget.showPasswordVisibility,
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
            final String? errorMessage =
                await auth.onForgotPassword(emailController.text);
            if (errorMessage != null && widget.checkError) {}
          },
        ),
      );

  bool get isForward =>
      transitionAnimation.value >= (100 - widget.formWidthRatio) / 2;
}
