library animated_login;

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'src/src_shelf.dart';

export 'src/constants/enums/enums_shelf.dart';
export 'src/models/models_shelf.dart';
export 'src/providers/login_texts.dart';
export 'src/providers/login_view_theme.dart';

part 'src/widgets/form_part.dart';
part 'src/widgets/welcome_components.dart';

/// [AnimatedLogin] is the main widget creates the animated login screen
/// Wraps the main view with providers.
class AnimatedLogin extends StatefulWidget {
  /// Default constructor for [AnimatedLogin].
  const AnimatedLogin({
    this.loginDesktopTheme,
    this.loginMobileTheme,
    this.loginTexts,
    this.socialLogins,
    this.onLogin,
    this.onSignup,
    this.onForgotPassword,
    this.formKey,
    this.checkError = true,
    @Deprecated('Instead prefer to use componentOrder to not show some parts.')
        this.showForgotPassword = true,
    @Deprecated('Instead prefer to use componentOrder to not show some parts.')
        this.showChangeActionTitle = true,
    this.showPasswordVisibility = true,
    this.nameValidator,
    this.emailValidator,
    this.passwordValidator,
    this.validateName = true,
    this.validateEmail = true,
    this.validatePassword = true,
    this.validateCheckbox = true,
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
    this.initialMode,
    this.onAuthModeChange,
    this.changeLangDefaultOnPressed,
    this.privacyPolicyChild,
    this.checkboxCallback,
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

  /// Determines all of the theme related variables for *DESKTOP* view.
  /// Example: colors, text styles, button styles.
  final LoginViewTheme? loginDesktopTheme;

  /// Determines all of the theme related variables for *MOBILE* view.
  /// Example: colors, text styles, button styles.
  final LoginViewTheme? loginMobileTheme;

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
  @Deprecated('Instead prefer to use componentOrder to not show some parts.')
  final bool showForgotPassword;

  /// Indicates whether the change action title should be displayed.
  @Deprecated('Instead prefer to use componentOrder to not show some parts.')
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

  /// Indicates whether the checkbox should be validated.
  final bool validateCheckbox;

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

  /// Optional logo widget to display. Its size is constrained.
  final Widget? logo;

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

  /// Optional function will be called on pressed to the change language button
  /// when the default button is preserved.
  final VoidCallback? changeLangDefaultOnPressed;

  /// If you update the state of parent widget of animated login,
  /// you should provide the last auth mode by using [onAuthModeChange].
  final AuthMode? initialMode;

  /// It is called on auth mode changes, you can store the current mode.
  final AuthModeChangeCallback? onAuthModeChange;

  /// Custom privacy policy child.
  final Widget? privacyPolicyChild;

  /// checkboxCallback is called when the checkbox is tapped.
  final ValueChanged<bool?>? checkboxCallback;

  @override
  State<AnimatedLogin> createState() => _AnimatedLoginState();
}

class _AnimatedLoginState extends State<AnimatedLogin> {
  late final GlobalKey<FormState> _formKey =
      widget.formKey ?? GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    /// Background color of whole screen for mobile view,
    /// of welcome part for web view.
    final LoginTheme loginTheme = LoginTheme(
      desktopTheme: widget.loginDesktopTheme,
      mobileTheme: widget.loginMobileTheme,
    )..backgroundColor ??= Theme.of(context).primaryColor.withOpacity(.8);
    final LoginTexts loginTexts = widget.loginTexts ?? LoginTexts()
      ..language = widget.selectedLanguage;
    final bool hasPrivacyPolicy = loginTheme.animatedComponentOrder.indexWhere(
            (AnimatedComponent c) =>
                c.component == LoginComponents.policyCheckbox) !=
        -1;
    return MultiProvider(
      providers: <ChangeNotifierProvider<dynamic>>[
        ChangeNotifierProvider<LoginTexts>.value(value: loginTexts),
        ChangeNotifierProvider<LoginTheme>.value(value: loginTheme),
        ChangeNotifierProvider<Auth>(
          create: (BuildContext context) => Auth(
            onForgotPassword: widget.onForgotPassword,
            onLogin: widget.onLogin,
            onSignup: widget.onSignup,
            checkboxCallback: widget.checkboxCallback,
            socialLogins: widget.socialLogins,
            initialMode: widget.initialMode,
            onAuthModeChange: widget.onAuthModeChange,
            signUpMode: widget.signUpMode,
            formKey: _formKey,
            showPasswordVisibility: widget.showPasswordVisibility,
            nameController: widget.nameController,
            emailController: widget.emailController,
            passwordController: widget.passwordController,
            confirmPasswordController: widget.confirmPasswordController,
            nameValidator: widget.nameValidator,
            emailValidator: widget.emailValidator,
            passwordValidator: widget.passwordValidator,
            validateName: widget.validateName,
            validateEmail: widget.validateEmail,
            validatePassword: widget.validatePassword,
            validateCheckbox: widget.validateCheckbox,
            hasPrivacyPolicy: hasPrivacyPolicy,
          ),
        ),
      ],
      child: kIsWeb
          ? _webScaffold(loginTheme.backgroundColor)
          : GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: Scaffold(
                  backgroundColor: loginTheme.backgroundColor, body: _safeArea),
            ),
    );
  }

  Widget _webScaffold(Color? backgroundColor) => Scaffold(
        backgroundColor: backgroundColor,
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final bool isLandscape =
                constraints.maxHeight / constraints.maxWidth < 1.05;
            context.read<LoginTheme>().setIsLandscape(isLandscape);
            return _safeArea;
          },
        ),
      );

  Widget get _safeArea => SafeArea(
        child: _View(
          formKey: _formKey,
          backgroundImage: widget.backgroundImage,
          logo: widget.logo,
          languageOptions: widget.languageOptions,
          changeLanguageCallback: widget.changeLanguageCallback,
          changeLangDefaultOnPressed: widget.changeLangDefaultOnPressed,
          changeLangOnPressed: widget.changeLangOnPressed,
          privacyPolicyChild: widget.privacyPolicyChild,
        ),
      );
}

class _View extends StatefulWidget {
  /// Draws the main view of the screen by using [_Form],
  /// [_Logo], [_Title], [_Description] [_ChangeActionTitle],
  /// and [_ChangeActionButton].
  const _View({
    required this.formKey,
    this.backgroundImage,
    this.logo,
    this.languageOptions = const <LanguageOption>[],
    this.changeLanguageCallback,
    this.changeLangOnPressed,
    this.changeLangDefaultOnPressed,
    this.privacyPolicyChild,
    Key? key,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final String? backgroundImage;
  final Widget? logo;
  final List<LanguageOption> languageOptions;
  final ChangeLanguageCallback? changeLanguageCallback;
  final ChangeLangOnPressedCallback? changeLangOnPressed;
  final VoidCallback? changeLangDefaultOnPressed;
  final Widget? privacyPolicyChild;

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

  /// Auth data provider.
  late Auth auth;

  /// The optional custom form key, if not provided will be created locally.
  late final GlobalKey<FormState> formKey = widget.formKey;

  bool _isLandscape = true;

  /// Transition animation that will change the location of the form part.
  late Animation<double> transitionAnimation;

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
    auth.nameController.dispose();
    auth.emailController.dispose();
    auth.passwordController.dispose();
    auth.confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    loginTexts = context.read<LoginTexts>();
    loginTheme = context.read<LoginTheme>();
    auth = context.read<Auth>();
    _isLandscape = context.watch<LoginTheme>().isLandscape;
    dynamicSize = DynamicSize(context);
    _initializeAnimations();
    return _isLandscape ? _webView : _mobileView;
  }

  Widget get _webView => Stack(
        children: <Widget>[
          Container(color: loginTheme.backgroundColor),
          _animatedWebWelcome,
          _WebForm(
            animationController: animationController,
            privacyPolicyChild: widget.privacyPolicyChild,
          ),
          if (widget.changeLanguageCallback != null &&
              loginTexts.language != null &&
              widget.languageOptions.isNotEmpty)
            _changeLanguage,
        ],
      );

  Widget get _mobileView => Stack(
        children: <Widget>[
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: dynamicSize.height,
                horizontal: dynamicSize.width * 7,
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: _children(_orderedMobileComponents),
                ),
              ),
            ),
          ),
          if (widget.changeLanguageCallback != null &&
              loginTexts.language != null &&
              widget.languageOptions.isNotEmpty)
            _changeLanguage,
        ],
      );

  Widget get _changeAction => _isLandscape
      ? _ChangeActionButton(animate: () async => _animate(context))
      : _ChangeActionTitle(
          showButtonText: true, animate: () => _animate(context));

  Widget _mobileWrapper(AnimationType animationType, Widget child) =>
      animationType == AnimationType.left
          ? _leftAnimation(child)
          : _rightAnimation(child);

  Widget _leftAnimation(Widget extChild) => AnimatedBuilder(
        animation: welcomeTransitionAnimation,
        child: extChild,
        builder: (BuildContext context, Widget? child) => Transform.translate(
          offset:
              Offset(dynamicSize.width * welcomeTransitionAnimation.value, 0),
          child: child,
        ),
      );

  Widget _rightAnimation(Widget child) => AnimatedBuilder(
        animation: transitionAnimation,
        child: child,
        builder: (BuildContext context, Widget? innerChild) =>
            Transform.translate(
          offset: Offset(dynamicSize.width * transitionAnimation.value, 0),
          child: innerChild,
        ),
      );

  Widget get _animatedWebWelcome => AnimatedBuilder(
        animation: animationController,
        child: _webWelcomeChild,
        builder: (BuildContext context, Widget? child) => Transform.translate(
          offset:
              Offset(dynamicSize.width * welcomeTransitionAnimation.value, 0),
          child: child,
        ),
      );

  Widget get _webWelcomeChild => Container(
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
      );

  Widget _webWelcomeComponents(BuildContext context) => Padding(
        padding: context.read<LoginTheme>().welcomePadding ??
            DynamicSize(context).medHighHorizontalPadding,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _children(_orderedWelcomeComponents)),
      );

  List<Widget> _children(
      Widget? Function(AnimatedComponent component) callback) {
    final List<Widget> items = <Widget>[];
    for (final AnimatedComponent component
        in loginTheme.animatedComponentOrder) {
      final Widget? foundComponent = callback(component);
      if (foundComponent == null) continue;
      items.add(foundComponent);
    }
    return items;
  }

  Widget? _orderedWelcomeComponents(AnimatedComponent component) {
    switch (component.component) {
      case LoginComponents.logo:
        return _isLandscape
            ? _Logo(logo: widget.logo)
            : _mobileWrapper(component.animationType, _Logo(logo: widget.logo));
      case LoginComponents.title:
        return _isLandscape
            ? const _Title()
            : _mobileWrapper(component.animationType, const _Title());
      case LoginComponents.description:
        return _isLandscape
            ? const _Description()
            : _mobileWrapper(component.animationType, const _Description());
      case LoginComponents.policyCheckbox:
        return context
                    .select<Auth, bool>((Auth auth) => auth.isAnimatedLogin) ||
                _isLandscape
            ? null
            : _mobileWrapper(
                component.animationType, const _PolicyCheckboxRow());
      case LoginComponents.notHaveAnAccount:
        return _isLandscape
            ? _ChangeActionTitle()
            : _mobileWrapper(component.animationType, _ChangeActionTitle());
      case LoginComponents.changeActionButton:
        return _isLandscape
            ? _changeAction
            : _mobileWrapper(component.animationType, _changeAction);
      default:
        return null;
    }
  }

  Widget? _orderedMobileComponents(AnimatedComponent component) {
    switch (component.component) {
      case LoginComponents.notHaveAnAccount:
        return null;
      case LoginComponents.socialLogins:
        if (auth.socialLogins != null && auth.socialLogins!.isNotEmpty) {
          return _mobileWrapper(
              component.animationType, const _SocialLoginOptions());
        }
        return null;
      case LoginComponents.useEmail:
        if (auth.socialLogins != null && auth.socialLogins!.isNotEmpty) {
          return _mobileWrapper(component.animationType, const _UseEmailText());
        }
        return null;
      case LoginComponents.form:
        return _mobileWrapper(component.animationType, const _Form());
      case LoginComponents.forgotPassword:
        return context.select<Auth, bool>((Auth auth) => auth.isAnimatedLogin)
            ? _mobileWrapper(component.animationType, const _ForgotPassword())
            : Container();
      case LoginComponents.actionButton:
        return _mobileWrapper(component.animationType, const _ActionButton());
      default:
        final Widget? foundInWelcome = _orderedWelcomeComponents(component);
        if (foundInWelcome != null) return foundInWelcome;
    }
    return null;
  }

  Widget get _changeLanguage => Positioned(
        top: dynamicSize.responsiveSize * 6,
        right: dynamicSize.responsiveSize * 8,
        child: _ChangeLanguage(
          chooseLanguageCallback: widget.changeLanguageCallback!,
          languageOptions: widget.languageOptions,
          colorTween: colorTween,
          onPressed: widget.changeLangOnPressed,
          defaultOnPressed: widget.changeLangDefaultOnPressed,
        ),
      );

  void _animate(BuildContext context) {
    if (!context.read<LoginTheme>().isLandscape) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
    animationController.isCompleted
        ? animationController.reverse()
        : animationController.forward();
    Provider.of<Auth>(context, listen: false).switchAuth();
  }

  void _initializeAnimations() {
    /// Initializes the transition animation from 0 to form part's width ratio
    /// with custom animation curve and animation controller.
    welcomeTransitionAnimation = _isLandscape
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
      if (mounted) {
        if (_isLandscape) {
          auth.setIsReverse(welcomeTransitionAnimation.value <=
              context.read<LoginTheme>().formWidthRatio / 2);
        } else if (_forwardCheck) {
          auth.setIsReverse(false);
        } else if (_reverseCheck) {
          auth.setIsReverse(true);
        }
      }
    });

    /// Initializes the transition animation from welcome part's width ratio
    /// to 0 with custom animation curve and animation controller.
    transitionAnimation = _isLandscape
        ? Tween<double>(begin: 100 - loginTheme.formWidthRatio, end: 0).animate(
            CurvedAnimation(
              parent: animationController,
              curve: loginTheme.animationCurve,
            ),
          )
        : AnimationHelper(
            animationController: animationController,
            animationCurve: loginTheme.animationCurve,
          ).tweenSequenceAnimation(120, 20);
  }

  bool get _forwardCheck =>
      welcomeTransitionAnimation.value > 0 &&
      welcomeTransitionAnimation.status == AnimationStatus.forward;

  bool get _reverseCheck =>
      welcomeTransitionAnimation.value < 0 &&
      welcomeTransitionAnimation.status == AnimationStatus.reverse;
}
