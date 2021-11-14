library animated_login;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'src/constants/enums/sign_up_modes.dart';
import 'src/decorations/button_styles.dart';
import 'src/decorations/text_styles.dart';
import 'src/models/language_option.dart';
import 'src/models/models_shelf.dart';
import 'src/providers/providers_shelf.dart';
import 'src/responsiveness/dynamic_size.dart';
import 'src/utils/animation_helper.dart';
import 'src/utils/validators.dart';
import 'src/utils/view_type_helper.dart';
import 'src/widgets/buttons/rounded_button.dart';
import 'src/widgets/dialogs/dialog_builder.dart';
import 'src/widgets/icons/base_icon.dart';
import 'src/widgets/texts/base_text.dart';
import 'src/widgets/texts/not_fitted_text.dart';
import 'src/widgets/widgets_shelf.dart';

export './src/constants/enums/sign_up_modes.dart';
export './src/models/models_shelf.dart';
export './src/providers/providers_shelf.dart';

part 'src/widgets/form_part.dart';
part 'src/widgets/welcome_components.dart';

/// Main widget creates the animated login screen
/// Wraps the main view with providers.
class AnimatedLogin extends StatefulWidget {
  const AnimatedLogin({
    this.loginTheme,
    this.loginTexts,
    this.socialLogins,
    this.onLogin,
    this.onSignup,
    this.onForgotPassword,
    this.formKey,
    this.checkError = true,
    this.showForgotPassword = true,
    this.showChangeActionTitle = true,
    this.showPasswordVisibility = true,
    this.nameValidator,
    this.emailValidator,
    this.passwordValidator,
    this.validateName = true,
    this.validateEmail = true,
    this.validatePassword = true,
    this.nameController,
    this.emailController,
    this.passwordController,
    this.confirmPasswordController,
    this.backgroundImage,
    this.logo,
    this.signUpMode = SignUpModes.both,
    this.languageOptions = const <LanguageOption>[],
    this.changeLanguageCallback,
    this.selectedLanguage,
    this.changeLangOnPressed,
    Key? key,
  })  : assert(
            (changeLanguageCallback != null &&
                    languageOptions.length != 0 &&
                    selectedLanguage != null) ||
                (changeLanguageCallback == null &&
                    languageOptions.length == 0 &&
                    selectedLanguage == null),
            """To use change language button, you should provide both callback and language options."""),
        super(key: key);

  /// Determines all of the theme related variables on the screen.
  /// Example: colors, text styles, button stylessrc.
  final LoginTheme? loginTheme;

  /// Determines all of the texts on the screen.
  final LoginTexts? loginTexts;

  /// List of social login options that will be provided.
  final List<SocialLogin>? socialLogins;

  /// Login callback that will be called after login button pressed.
  final LoginCallback? onLogin;

  /// Signup callback that will be called after signup button pressed.
  final SignupCallback? onSignup;

  /// Callback that will be called after on tap of forgot password text.
  /// Commonly it navigates user to a screen to reset the password.
  final ForgotPasswordCallback? onForgotPassword;

  /// The optional custom form key, if not provided will be created locally.
  final GlobalKey<FormState>? formKey;

  /// Indicates whether the login screen should handle errors,
  /// show the error messages returned from the callbacks in a dialog.
  final bool checkError;

  /// Indicates whether the forgot password option will be enabled.
  final bool showForgotPassword;

  /// Indicates whether the change action title should be displayed.
  final bool showChangeActionTitle;

  /// Indicates whether the user can show the password text without obscuring.
  final bool showPasswordVisibility;

  /// Custom input validator for name field.
  final ValidatorModel? nameValidator;

  /// Custom input validator for email field.
  final ValidatorModel? emailValidator;

  /// Custom input validator for password field.
  final ValidatorModel? passwordValidator;

  /// Indicates whether the name field should be validated.
  final bool validateName;

  /// Indicates whether the email field should be validated.
  final bool validateEmail;

  /// Indicates whether the password fields should be validated.
  final bool validatePassword;

  /// Optional TextEditingController for name input field.
  final TextEditingController? nameController;

  /// Optional TextEditingController for email input field.
  final TextEditingController? emailController;

  /// Optional TextEditingController for password input field.
  final TextEditingController? passwordController;

  /// Optional TextEditingController for confirm password input field.
  final TextEditingController? confirmPasswordController;

  /// Full asset image path for background of the welcome part.
  final String? backgroundImage;

  /// Full asset image path for the logo.
  final String? logo;

  /// Enum to determine which text form fields should be displayed in addition
  /// to the email and password fields: Name / Confirm Password / Both
  final SignUpModes signUpMode;

  /// List of languages that user can select.
  final List<LanguageOption> languageOptions;

  /// Callback that will be called when a language is selected.
  final ChangeLanguageCallback? changeLanguageCallback;

  /// Selected language that is stored in your side.
  /// It will be used as an initial language at first.
  final LanguageOption? selectedLanguage;

  /// Optional function will be called on pressed to the change language button.
  /// It should prompt a dialog to select a language and return the selected.
  final ChangeLangOnPressedCallback? changeLangOnPressed;

  @override
  State<AnimatedLogin> createState() => _AnimatedLoginState();
}

class _AnimatedLoginState extends State<AnimatedLogin> {
  @override
  Widget build(BuildContext context) {
    /// Background color of whole screen for mobile view,
    /// of welcome part for web view.
    final Color backgroundColor = widget.loginTheme?.backgroundColor ??
        Theme.of(context).primaryColor.withOpacity(.8);
    widget.loginTheme?.backgroundColor = backgroundColor;
    final LoginTheme loginTheme = widget.loginTheme ?? LoginTheme()
      ..isLandscape = ViewTypeHelper(context).isLandscape
      ..backgroundColor = backgroundColor;
    final LoginTexts loginTexts = widget.loginTexts ?? LoginTexts()
      ..language = widget.selectedLanguage;
    return MultiProvider(
      providers: <ChangeNotifierProvider<dynamic>>[
        ChangeNotifierProvider<LoginTexts>.value(value: loginTexts),
        ChangeNotifierProvider<LoginTheme>.value(value: loginTheme),
        ChangeNotifierProvider<Auth>(
          create: (BuildContext context) => Auth(
            onForgotPassword: widget.onForgotPassword,
            onLogin: widget.onLogin,
            onSignup: widget.onSignup,
            socialLogins: widget.socialLogins,
          ),
        ),
      ],
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          WidgetsBinding.instance!.addPostFrameCallback((_) => context
              .read<LoginTheme>()
              .setIsLandscape(ViewTypeHelper(context).isLandscape));
          return SafeArea(
            child: _View(
              formKey: widget.formKey,
              checkError: widget.checkError,
              showForgotPassword: widget.showForgotPassword,
              showChangeActionTitle: widget.showChangeActionTitle,
              showPasswordVisibility: widget.showPasswordVisibility,
              nameController: widget.nameController,
              emailController: widget.emailController,
              passwordController: widget.passwordController,
              confirmPasswordController: widget.confirmPasswordController,
              backgroundImage: widget.backgroundImage,
              logo: widget.logo,
              signUpMode: widget.signUpMode,
              languageOptions: widget.languageOptions,
              changeLanguageCallback: widget.changeLanguageCallback,
              changeLangOnPressed: widget.changeLangOnPressed,
              nameValidator: widget.nameValidator,
              emailValidator: widget.emailValidator,
              passwordValidator: widget.passwordValidator,
              validateName: widget.validateName,
              validateEmail: widget.validateEmail,
              validatePassword: widget.validatePassword,
            ),
          );
        }),
      ),
    );
  }
}

/// Draws the main view of the screen by using
/// [_FormPart], [_LogoAndTexts], [_ChangeActionTitle] and [_ChangeActionButton]
class _View extends StatefulWidget {
  const _View({
    this.formKey,
    this.checkError = true,
    this.showForgotPassword = true,
    this.showChangeActionTitle = true,
    this.showPasswordVisibility = true,
    this.nameController,
    this.emailController,
    this.passwordController,
    this.confirmPasswordController,
    this.backgroundImage,
    this.logo,
    this.signUpMode = SignUpModes.both,
    this.languageOptions = const <LanguageOption>[],
    this.changeLanguageCallback,
    this.changeLangOnPressed,
    this.nameValidator,
    this.emailValidator,
    this.passwordValidator,
    this.validateName = true,
    this.validateEmail = true,
    this.validatePassword = true,
    Key? key,
  }) : super(key: key);

  final GlobalKey<FormState>? formKey;
  final bool checkError;
  final bool showForgotPassword;
  final bool showChangeActionTitle;
  final bool showPasswordVisibility;
  final TextEditingController? nameController;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final TextEditingController? confirmPasswordController;
  final String? backgroundImage;
  final String? logo;
  final SignUpModes signUpMode;
  final List<LanguageOption> languageOptions;
  final ChangeLanguageCallback? changeLanguageCallback;
  final ChangeLangOnPressedCallback? changeLangOnPressed;
  final ValidatorModel? nameValidator;
  final ValidatorModel? emailValidator;
  final ValidatorModel? passwordValidator;
  final bool validateName;
  final bool validateEmail;
  final bool validatePassword;

  @override
  __ViewState createState() => __ViewState();
}

class __ViewState extends State<_View> with SingleTickerProviderStateMixin {
  /// Dynamic size object to give responsive size values.
  late DynamicSize dynamicSize;

  /// Main animation controller for the transition animations.
  late final AnimationController animationController;

  /// Transition animation that will change the location of the welcome part.
  late Animation<double> welcomeTransitionAnimation;

  /// Animation for color change in the change language button.
  late Animation<double> colorTween;

  /// Custom LoginTheme data, colors and styles on the screen.
  late LoginTheme loginTheme;

  /// Custom LoginTexts data, texts on the screen.
  late LoginTexts loginTexts;

  /// The optional custom form key, if not provided will be created locally.
  late final GlobalKey<FormState> formKey =
      widget.formKey ?? GlobalKey<FormState>();

  bool isLandscape = true;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: context.read<LoginTheme>().animationDuration ??
          const Duration(milliseconds: 600),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    loginTexts = context.read<LoginTexts>();
    loginTheme = context.read<LoginTheme>();
    isLandscape = context.watch<LoginTheme>().isLandscape;
    dynamicSize = DynamicSize(context);
    _initializeAnimations();
    return AnimatedBuilder(
      animation: animationController,
      builder: (_, __) => isLandscape ? _webView : _mobileView,
    );
  }

  Widget get _webView => Stack(
        children: <Widget>[
          Container(color: loginTheme.backgroundColor),
          _animatedWebWelcome,
          _formPart,
          if (widget.changeLanguageCallback != null &&
              loginTexts.language != null &&
              widget.languageOptions.isNotEmpty)
            _changeLanguage,
        ],
      );

  Widget get _mobileView => Stack(
        children: <Widget>[
          Center(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(
                vertical: dynamicSize.height * 2.5,
                horizontal: dynamicSize.width * 7,
              ),
              children: <Widget>[
                _welcomeAnimationWrapper(_logoAndTexts),
                _formPart,
                SizedBox(height: dynamicSize.height * 2.5),
                if (widget.showChangeActionTitle)
                  _welcomeAnimationWrapper(
                    _ChangeActionTitle(
                      isReverse: loginTheme.isReverse,
                      showButtonText: true,
                      animate: () => animate(context),
                    ),
                  ),
              ],
            ),
          ),
          if (widget.changeLanguageCallback != null &&
              loginTexts.language != null &&
              widget.languageOptions.isNotEmpty)
            _changeLanguage,
        ],
      );

  Widget _welcomeAnimationWrapper(Widget child) => Transform.translate(
        offset: Offset(dynamicSize.width * welcomeTransitionAnimation.value, 0),
        child: child,
      );

  Widget get _animatedWebWelcome => Transform.translate(
        offset: Offset(dynamicSize.width * welcomeTransitionAnimation.value, 0),
        child: Container(
          decoration: BoxDecoration(
            color: loginTheme.backgroundColor,
            image: widget.backgroundImage == null
                ? null
                : DecorationImage(
                    image: AssetImage(widget.backgroundImage!),
                    fit: BoxFit.cover,
                  ),
          ),
          width: dynamicSize.width *
              (100 - context.read<LoginTheme>().formWidthRatio),
          height: dynamicSize.height * 100,
          child: _webWelcomeComponents(context),
        ),
      );

  Widget _webWelcomeComponents(BuildContext context) => Padding(
        padding: context.read<LoginTheme>().welcomePadding ??
            DynamicSize(context).medHighHorizontalPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _logoAndTexts,
            SizedBox(height: DynamicSize(context).height * 7),
            if (widget.showChangeActionTitle)
              _ChangeActionTitle(isReverse: loginTheme.isReverse),
            SizedBox(height: DynamicSize(context).height * 2),
            _changeActionButton,
          ],
        ),
      );

  Widget get _changeLanguage => Positioned(
        top: dynamicSize.responsiveSize * 6,
        right: dynamicSize.responsiveSize * 8,
        child: _ChangeLanguage(
          chooseLanguageCallback: widget.changeLanguageCallback!,
          languageOptions: widget.languageOptions,
          colorTween: colorTween,
          onPressed: widget.changeLangOnPressed,
        ),
      );

  Widget get _logoAndTexts => _LogoAndTexts(
        logo: widget.logo,
        isReverse: loginTheme.isReverse,
      );

  Widget get _changeActionButton => _ChangeActionButton(
        isReverse: loginTheme.isReverse,
        animate: () => animate(context),
      );

  Widget get _formPart => _FormPart(
        animationController: animationController,
        formKey: formKey,
        checkError: widget.checkError,
        showForgotPassword: widget.showForgotPassword,
        showPasswordVisibility: widget.showPasswordVisibility,
        nameController: widget.nameController,
        emailController: widget.emailController,
        passwordController: widget.passwordController,
        confirmPasswordController: widget.confirmPasswordController,
        signUpMode: widget.signUpMode,
        nameValidator: widget.nameValidator,
        emailValidator: widget.emailValidator,
        passwordValidator: widget.passwordValidator,
        validateName: widget.validateName,
        validateEmail: widget.validateEmail,
        validatePassword: widget.validatePassword,
      );

  void animate(BuildContext context) {
    formKey.currentState?.reset();
    animationController.isCompleted
        ? animationController.reverse()
        : animationController.forward();
    Provider.of<Auth>(context, listen: false).switchAuth();
  }

  void _initializeAnimations() {
    /// Initializes the transition animation from 0 to form part's width ratio
    /// with custom animation curve and animation controller.
    welcomeTransitionAnimation = isLandscape
        ? Tween<double>(begin: 0, end: loginTheme.formWidthRatio).animate(
            CurvedAnimation(
              parent: animationController,
              curve: loginTheme.animationCurve,
            ),
          )
        : AnimationHelper(
            animationController: animationController,
            animationCurve: loginTheme.animationCurve,
          ).tweenSequenceAnimation(-110, 20);

    colorTween = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: loginTheme.animationCurve,
      ),
    );

    welcomeTransitionAnimation.addListener(() {
      if (isLandscape) {
        loginTheme.isReverse =
            welcomeTransitionAnimation.value <= loginTheme.formWidthRatio / 2;
      } else if (_forwardCheck) {
        loginTheme.isReverse = !loginTheme.isReverse;
      }
    });
  }

  bool get _forwardCheck => isLandscape
      ? welcomeTransitionAnimation.value <=
          context.read<LoginTheme>().formWidthRatio / 2
      : welcomeTransitionAnimation.value <= -100 && _statusCheck;

  bool get _statusCheck =>
      (welcomeTransitionAnimation.status == AnimationStatus.forward &&
          loginTheme.isReverse) ||
      (welcomeTransitionAnimation.status == AnimationStatus.reverse &&
          !loginTheme.isReverse);
}
