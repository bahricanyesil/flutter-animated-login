library animated_login;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/constants/curve/custom_curves.dart';
import 'src/decorations/text_styles.dart';
import 'src/models/social_login.dart';
import 'src/providers/auth.dart';
import 'src/providers/login_texts.dart';
import 'src/providers/login_theme.dart';
import 'src/responsiveness/dynamic_size.dart';
import 'src/utils/device_type_helper.dart';
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
    Key? key,
  }) : super(key: key);

  final LoginTheme? loginTheme;
  final LoginTexts? loginTexts;
  final List<SocialLogin>? socialLogins;

  @override
  _AnimatedLoginState createState() => _AnimatedLoginState();
}

class _AnimatedLoginState extends State<AnimatedLogin>
    with TickerProviderStateMixin {
  late final AnimationController animationController;
  late final AnimationController scaleAnimationController;
  late final Animation<double> scaleAnimation;
  late ThemeData theme;
  bool isLandscape = true;
  late Color backgroundColor =
      widget.loginTheme?.backgroundColor ?? theme.primaryColor.withOpacity(.8);

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    scaleAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    scaleAnimation = Tween<double>(begin: 1, end: 1.2).animate(
      CurvedAnimation(
        parent: scaleAnimationController,
        curve: CustomCurves.animationCurve,
      ),
    );
    scaleAnimation.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.forward) {
        scaleAnimationController.reverse();
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    scaleAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    isLandscape = DeviceTypeHelper(context).isLandscape;
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
              // onLogin: widget.onLogin,
              // onSignup: widget.onSignup,
              // onRecoverPassword: widget.onRecoverPassword,
              // loginProviders: widget.loginProviders,
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
          _backgroundImage,
          Container(color: backgroundColor),
          _InformingPart(
            backgroundColor: backgroundColor,
            animationController: animationController,
            scaleAnimation: scaleAnimation,
            loginTheme: widget.loginTheme ?? LoginTheme(),
            loginTexts: widget.loginTexts ?? LoginTexts(),
            animate: animate,
          ),
          _FormPart(
            backgroundColor: backgroundColor,
            animationController: animationController,
            scaleAnimation: scaleAnimation,
            loginTheme: widget.loginTheme ?? LoginTheme(),
            loginTexts: widget.loginTexts ?? LoginTexts(),
          ),
        ],
      );

  Widget get _backgroundImage => Image.asset(
        'assets/images/auth/${isLandscape ? 'login_bg_vertical.png' : 'login_bg.png'}',
        fit: BoxFit.fill,
      );

  void animate(BuildContext localContext) {
    scaleAnimationController.forward();
    animationController.isCompleted
        ? animationController.reverse()
        : animationController.forward();
    Provider.of<Auth>(localContext, listen: false).switchAuth();
  }
}

class _InformingPart extends StatefulWidget {
  const _InformingPart({
    required this.backgroundColor,
    required this.animationController,
    required this.scaleAnimation,
    required this.loginTheme,
    required this.loginTexts,
    required this.animate,
    Key? key,
  }) : super(key: key);
  final Color backgroundColor;
  final AnimationController animationController;
  final Animation<double> scaleAnimation;
  final LoginTheme loginTheme;
  final LoginTexts loginTexts;
  final Function(BuildContext context) animate;

  @override
  __InformingPartState createState() => __InformingPartState();
}

class __InformingPartState extends State<_InformingPart> {
  late DynamicSize dynamicSize;
  late Auth auth;
  late ThemeData theme;
  late final Animation<double> transitionAnimation;

  @override
  void initState() {
    super.initState();
    transitionAnimation = Tween<double>(begin: 0, end: 60).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: CustomCurves.animationCurve,
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
      child: Transform(
        transform: Matrix4.diagonal3Values(widget.scaleAnimation.value, 1, 1),
        child: Container(
          color: widget.backgroundColor
              .withOpacity(widget.animationController.value <= .4 ? .7 : 1),
          width: dynamicSize.width * 40,
          height: dynamicSize.height * 100,
          child: _welcomeTexts,
        ),
      ),
    );
  }

  Widget get _welcomeTexts => Padding(
        padding: dynamicSize.medHighHorizontalPadding,
        child: Column(
          children: <Widget>[
            const Spacer(flex: 10),
            Expanded(flex: 6, child: _title),
            SizedBox(height: dynamicSize.height * 4),
            Expanded(flex: 4, child: _description),
            SizedBox(height: dynamicSize.height * 6),
            _changeActionButton,
            const Spacer(flex: 10),
          ],
        ),
      );

  Widget get _title => BaseText(
        isForward ? widget.loginTexts.welcomeBack : widget.loginTexts.welcome,
        style: TextStyles(context).titleStyle(color: Colors.white),
      );

  Widget get _description => NotFittedText(
        isForward
            ? widget.loginTexts.welcomeBackDescription
            : widget.loginTexts.welcomeDescription,
        maxLines: 2,
        style: TextStyles(context).bodyStyle(),
      );

  Widget get _changeActionButton => RoundedButton(
        buttonText:
            isForward ? widget.loginTexts.signUp : widget.loginTexts.login,
        onPressed: () => widget.animate(context),
        borderColor: Colors.white,
        backgroundColor: theme.primaryColor.withOpacity(.8),
        width: dynamicSize.width * 15,
        height: dynamicSize.height * 10,
      );

  bool get isForward => transitionAnimation.value <= 0.5 && auth.isLogin;
}

class _FormPart extends StatefulWidget {
  const _FormPart({
    required this.backgroundColor,
    required this.animationController,
    required this.scaleAnimation,
    required this.loginTheme,
    required this.loginTexts,
    this.socialLogins = const <SocialLogin>[],
    Key? key,
  }) : super(key: key);
  final Color backgroundColor;
  final AnimationController animationController;
  final Animation<double> scaleAnimation;
  final LoginTheme loginTheme;
  final LoginTexts loginTexts;
  final List<SocialLogin> socialLogins;

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    transitionAnimation = Tween<double>(begin: 40, end: 0).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: CustomCurves.animationCurve,
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
        curve: CustomCurves.animationCurve,
      ),
    );
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
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
      child: Transform(
        transform: Matrix4.diagonal3Values(widget.scaleAnimation.value, 1, 1),
        child: Container(
          width: dynamicSize.width * 60,
          height: dynamicSize.height * 100,
          color: Colors.white,
          child: _formColumn,
        ),
      ),
    );
  }

  Widget get _formColumn => Transform.translate(
        offset: Offset(dynamicSize.width * offsetAnimation.value, 0),
        child: Padding(
          padding: dynamicSize.highHorizontalPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Spacer(flex: 2),
              Expanded(flex: 3, child: _formTitle),
              if (widget.socialLogins.isNotEmpty) ..._socialLoginPart,
              Expanded(flex: 10, child: _form),
              SizedBox(height: dynamicSize.height * 3),
              _actionButton,
              const Spacer(flex: 2),
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
        Expanded(child: _socialLoginOptions),
        SizedBox(height: dynamicSize.height * 8),
        Expanded(flex: 2, child: _useEmailText),
        SizedBox(height: dynamicSize.height * 2),
      ];

  Widget get _formTitle => BaseText(
        isForward
            ? widget.loginTexts.loginFormTitle
            : widget.loginTexts.signUpFormTitle,
        style: TextStyles(context).titleStyle(),
      );

  Widget get _socialLoginOptions => Wrap(
        spacing: dynamicSize.width * 2,
        alignment: WrapAlignment.center,
        children: _socialLoginButtons,
      );

  Widget get _useEmailText => BaseText(
        isForward
            ? widget.loginTexts.loginUseEmail
            : widget.loginTexts.signUpUseEmail,
        style: theme.textTheme.headline6!.copyWith(color: Colors.black),
      );

  List<Widget> get _socialLoginButtons => List<Widget>.generate(
        widget.socialLogins.length,
        (int index) => CircleWidget(
          onTap: widget.socialLogins[index].callback,
          child: Image.asset(
              'assets/images/auth/${widget.socialLogins[index].iconPath}.png'),
        ),
      );

  Widget get _actionButton => RoundedButton(
        buttonText:
            isForward ? widget.loginTexts.login : widget.loginTexts.signUp,
        onPressed: () {},
        backgroundColor: theme.primaryColor.withOpacity(.8),
        width: dynamicSize.width * 15,
        height: dynamicSize.height * 10,
      );

  Form get _form => Form(
        key: _formKey,
        child: Wrap(
          direction: Axis.vertical,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: dynamicSize.height * 2,
          children: <Widget>[
            CustomTextFormField(
              controller: nameController,
              hintText: 'Name',
              prefixIcon: Icons.person_outline,
            ),
            CustomTextFormField(
              controller: emailController,
              hintText: 'Email',
              prefixIcon: Icons.email_outlined,
            ),
            _lastFormElement,
          ],
        ),
      );

  Widget get _lastFormElement => widget.animationController.value >= .5
      ? ObscuredTextFormField(
          controller: passwordController,
          hintText: 'Password',
          prefixIcon: Icons.password_outlined,
        )
      : Padding(
          padding: dynamicSize.medTopPadding,
          child: BaseText(
            widget.loginTexts.forgotPassword,
            color: theme.primaryColor,
          ),
        );

  bool get isForward => transitionAnimation.value >= 0.5 && auth.isLogin;
}
