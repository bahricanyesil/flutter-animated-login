import 'package:flutter/material.dart';

class LoginTexts with ChangeNotifier {
  LoginTexts({
    String? welcome,
    String? welcomeDescription,
    String? signUp,
    String? signUpFormTitle,
    String? signUpUseEmail,
    String? welcomeBack,
    String? welcomeBackDescription,
    String? login,
    String? loginFormTitle,
    String? loginUseEmail,
    String? forgotPassword,
  })  : _welcome = welcome,
        _welcomeDescription = welcomeDescription,
        _signUp = signUp,
        _signUpFormTitle = signUpFormTitle,
        _signUpUseEmail = signUpUseEmail,
        _welcomeBack = welcomeBack,
        _welcomeBackDescription = welcomeBackDescription,
        _login = login,
        _loginFormTitle = loginFormTitle,
        _loginUseEmail = loginUseEmail,
        _forgotPassword = forgotPassword;

  /// Welcome title in signUp mode for the informing part.
  /// Default value is given in [defaultWelcome].
  /// Custom value in the constructor is assigned to [_welcome].
  String get welcome => _welcome ?? defaultWelcome;

  /// Welcome description in signUp mode for the informing part.
  /// Default value is given in [defaultWelcomeDescription].
  /// Custom value in the constructor is assigned to [_welcomeDescription].
  String get welcomeDescription =>
      _welcomeDescription ?? defaultWelcomeDescription;

  /// Button text for sign up mode.
  /// Default value is given in [defaultSignUp].
  /// Custom value in the constructor is assigned to [_signUp].
  String get signUp => _signUp ?? defaultSignUp;

  /// Form title for sign up mode.
  /// Default value is given in [defaultSignUpFormTitle].
  /// Custom value in the constructor is assigned to [_signUpFormTitle].
  String get signUpFormTitle => _signUpFormTitle ?? defaultSignUpFormTitle;

  /// Use email CTA for sign up mode.
  /// Default value is given in [defaultSignUpUseEmail].
  /// Custom value in the constructor is assigned to [_signUpUseEmail].
  String get signUpUseEmail => _signUpUseEmail ?? defaultSignUpUseEmail;

  /// Welcome title in login mode for the informing part.
  /// Default value is given in [defaultWelcomeBack].
  /// Custom value in the constructor is assigned to [_welcomeBack].
  String get welcomeBack => _welcomeBack ?? defaultWelcomeBack;

  /// Welcome description in login mode for the informing part.
  /// Default value is given in [defaultWelcomeBackDescription].
  /// Custom value in the constructor is assigned to [_welcomeBackDescription].
  String get welcomeBackDescription =>
      _welcomeBackDescription ?? defaultWelcomeBackDescription;

  /// Button text for login mode.
  /// Default value is given in [defaultLogin].
  /// Custom value in the constructor is assigned to [_login].
  String get login => _login ?? defaultLogin;

  /// Form title for login mode.
  /// Default value is given in [defaultLoginFormTitle].
  /// Custom value in the constructor is assigned to [_loginFormTitle].
  String get loginFormTitle => _loginFormTitle ?? defaultLoginFormTitle;

  /// Use email CTA for login mode.
  /// Default value is given in [defaultLoginUseEmail].
  /// Custom value in the constructor is assigned to [_loginUseEmail].
  String get loginUseEmail => _loginUseEmail ?? defaultLoginUseEmail;

  /// Forgot password text for login mode.
  /// Default value is given in [defaultForgotPassword].
  /// Custom value in the constructor is assigned to [_forgotPassword].
  String get forgotPassword => _forgotPassword ?? defaultForgotPassword;

  static const String defaultWelcome = 'Welcome!';
  static const String defaultWelcomeDescription =
      'You are where you find the best you are looking for!';
  static const String defaultSignUp = 'Sign Up';
  static const String defaultSignUpFormTitle = 'Create an Account';
  static const String defaultSignUpUseEmail =
      'or use your email for registration:';
  static const String defaultWelcomeBack = 'Welcome Back!';
  static const String defaultWelcomeBackDescription =
      "Welcome back to the best. We're always here, waiting for you!";
  static const String defaultLogin = 'Login';
  static const String defaultLoginFormTitle = 'Login to Account';
  static const String defaultLoginUseEmail = 'or use your email account:';
  static const String defaultForgotPassword = 'Forgot Password';

  final String? _welcome;

  /// Hint text of the password [TextField]
  final String? _welcomeDescription;

  /// Hint text of the confirm password [TextField]
  final String? _signUp;

  /// Forgot password button's label
  final String? _signUpFormTitle;

  /// Login button's label
  final String? _signUpUseEmail;

  /// Signup button's label
  final String? _welcomeBack;

  /// Recover password button's label
  final String? _welcomeBackDescription;

  /// Intro in password recovery form
  final String? _login;

  /// Description in password recovery form
  final String? _loginFormTitle;

  /// Go back button's label. Go back button is used to go back to to
  /// login/signup form from the recover password form
  final String? _loginUseEmail;

  /// The error message to show when the confirm password not match with the
  /// original password
  final String? _forgotPassword;
}
