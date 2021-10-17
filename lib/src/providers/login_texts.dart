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
    String? dontHaveAnAccount,
    String? alreadyHaveAnAccount,
    String? nameHint,
    String? emailHint,
    String? passwordHint,
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
        _forgotPassword = forgotPassword,
        _dontHaveAnAccount = dontHaveAnAccount,
        _alreadyHaveAnAccount = alreadyHaveAnAccount,
        _nameHint = nameHint,
        _emailHint = emailHint,
        _passwordHint = passwordHint;

  /// Welcome title in signUp mode for the informing part.
  /// Default value is given in [_defaultWelcome].
  /// Custom value in the constructor is assigned to [_welcome].
  String get welcome => _welcome ?? _defaultWelcome;

  /// Welcome description in signUp mode for the informing part.
  /// Default value is given in [_defaultWelcomeDescription].
  /// Custom value in the constructor is assigned to [_welcomeDescription].
  String get welcomeDescription =>
      _welcomeDescription ?? _defaultWelcomeDescription;

  /// Button text for sign up mode.
  /// Default value is given in [_defaultSignUp].
  /// Custom value in the constructor is assigned to [_signUp].
  String get signUp => _signUp ?? _defaultSignUp;

  /// Form title for sign up mode.
  /// Default value is given in [_defaultSignUpFormTitle].
  /// Custom value in the constructor is assigned to [_signUpFormTitle].
  String get signUpFormTitle => _signUpFormTitle ?? _defaultSignUpFormTitle;

  /// Use email CTA for sign up mode.
  /// Default value is given in [_defaultSignUpUseEmail].
  /// Custom value in the constructor is assigned to [_signUpUseEmail].
  String get signUpUseEmail => _signUpUseEmail ?? _defaultSignUpUseEmail;

  /// Welcome title in login mode for the informing part.
  /// Default value is given in [_defaultWelcomeBack].
  /// Custom value in the constructor is assigned to [_welcomeBack].
  String get welcomeBack => _welcomeBack ?? _defaultWelcomeBack;

  /// Welcome description in login mode for the informing part.
  /// Default value is given in [_defaultWelcomeBackDescription].
  /// Custom value in the constructor is assigned to [_welcomeBackDescription].
  String get welcomeBackDescription =>
      _welcomeBackDescription ?? _defaultWelcomeBackDescription;

  /// Button text for login mode.
  /// Default value is given in [_defaultLogin].
  /// Custom value in the constructor is assigned to [_login].
  String get login => _login ?? _defaultLogin;

  /// Form title for login mode.
  /// Default value is given in [_defaultLoginFormTitle].
  /// Custom value in the constructor is assigned to [_loginFormTitle].
  String get loginFormTitle => _loginFormTitle ?? _defaultLoginFormTitle;

  /// Use email CTA for login mode.
  /// Default value is given in [_defaultLoginUseEmail].
  /// Custom value in the constructor is assigned to [_loginUseEmail].
  String get loginUseEmail => _loginUseEmail ?? _defaultLoginUseEmail;

  /// Forgot password text for login mode.
  /// Default value is given in [_defaultForgotPassword].
  /// Custom value in the constructor is assigned to [_forgotPassword].
  String get forgotPassword => _forgotPassword ?? _defaultForgotPassword;

  /// Text above the sign up button to direct users who don't have an account.
  /// Default value is given in [_defaultDontHaveAnAccount].
  /// Custom value in the constructor is assigned to [_dontHaveAnAccount].
  String get dontHaveAnAccount =>
      _dontHaveAnAccount ?? _defaultDontHaveAnAccount;

  /// Text above the login button to direct users who already have an account.
  /// Default value is given in [_defaultAlreadyHaveAnAccount].
  /// Custom value in the constructor is assigned to [_alreadyHaveAnAccount].
  String get alreadyHaveAnAccount =>
      _alreadyHaveAnAccount ?? _defaultAlreadyHaveAnAccount;

  /// Hint text for name text form field.
  /// Default value is given in [_defaultNameHint].
  /// Custom value in the constructor is assigned to [_nameHint].
  String get nameHint => _nameHint ?? _defaultNameHint;

  /// Hint text for email text form field.
  /// Default value is given in [_defaultEmailHint].
  /// Custom value in the constructor is assigned to [_emailHint].
  String get emailHint => _emailHint ?? _defaultEmailHint;

  /// Hint text for password text form field.
  /// Default value is given in [_defaultPasswordHint].
  /// Custom value in the constructor is assigned to [_passwordHint].
  String get passwordHint => _passwordHint ?? _defaultPasswordHint;

  static const String _defaultWelcome = 'Welcome!';
  static const String _defaultWelcomeDescription =
      'You are where you find the best you are looking for!';
  static const String _defaultSignUp = 'Sign Up';
  static const String _defaultSignUpFormTitle = 'Create an Account';
  static const String _defaultSignUpUseEmail =
      'or use your email for registration:';
  static const String _defaultDontHaveAnAccount = "Don't have an account?";
  static const String _defaultWelcomeBack = 'Welcome Back!';
  static const String _defaultWelcomeBackDescription =
      "Welcome back to the best. We're always here, waiting for you!";
  static const String _defaultLogin = 'Login';
  static const String _defaultLoginFormTitle = 'Login to Account';
  static const String _defaultLoginUseEmail = 'or use your email account:';
  static const String _defaultForgotPassword = 'Forgot Password?';
  static const String _defaultAlreadyHaveAnAccount = 'Already have an account?';

  static const String _defaultNameHint = 'Name';
  static const String _defaultEmailHint = 'Email';
  static const String _defaultPasswordHint = 'Password';

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

  /// The message to show above the sign up button. Call to action for
  /// directing users who doesn't have an account to the sign up mode.
  final String? _dontHaveAnAccount;

  /// The message to show above the login button. Call to action for
  /// directing users who already have an account to the login mode.
  final String? _alreadyHaveAnAccount;

  /// The hint text for name text form field.
  final String? _nameHint;

  /// The hint text for email text form field.
  final String? _emailHint;

  /// The hint text for password text form field.
  final String? _passwordHint;
}
