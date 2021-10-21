import 'package:flutter/material.dart';

import '../constants/enums/auth_mode.dart';
import '../models/models_shelf.dart';

// if there is any error message.
/// [Auth] is the provider for auth related data, functions.
/// Manages the state related to the authentication modes.
class Auth with ChangeNotifier {
  Auth({
    this.socialLogins = const <SocialLogin>[],
    LoginCallback? onLogin,
    SignupCallback? onSignup,
    ForgotPasswordCallback? onForgotPassword,
  }) {
    _onLogin = onLogin ?? _defaultLoginFunc;
    _onSignup = onSignup ?? _defaultSignupFunc;
    _onForgotPassword = onForgotPassword ?? _defaultForgotPassFunc;
  }

  /// Default login, signup and forgot password functions to be
  /// called in case any custom functions are not provided.
  Future<String?> _defaultLoginFunc(LoginData a) async => null;
  Future<String?> _defaultSignupFunc(SignUpData a) async => null;
  Future<String?> _defaultForgotPassFunc(String e) async => null;

  /// Function to be called on login action.
  late final LoginCallback _onLogin;
  LoginCallback get onLogin => _onLogin;

  /// Function to be called on signup action.
  late final SignupCallback _onSignup;
  SignupCallback get onSignup => _onSignup;

  /// Function to be called on click to forgot password text.
  late final ForgotPasswordCallback _onForgotPassword;
  ForgotPasswordCallback get onForgotPassword => _onForgotPassword;

  /// List of social login options.
  final List<SocialLogin>? socialLogins;

  /// Current authentication mode of the screen.
  /// Uses [AuthMode] enum's values.
  AuthMode _mode = AuthMode.login;
  AuthMode get mode => _mode;
  set mode(AuthMode value) {
    _mode = value;
    notifyListeners();
  }

  /// Returns whether the current [_mode] is login or signup mode.
  bool get isLogin => _mode == AuthMode.login;
  bool get isSignup => _mode == AuthMode.signup;

  /// Switches the authentication mode and notify the listeners.
  AuthMode switchAuth() {
    if (mode == AuthMode.login) {
      mode = AuthMode.signup;
    } else if (mode == AuthMode.signup) {
      mode = AuthMode.login;
    }
    return mode;
  }
}
