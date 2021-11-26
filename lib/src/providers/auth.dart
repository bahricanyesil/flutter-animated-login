import 'package:flutter/material.dart';

import '../constants/enums/auth_mode.dart';
import '../models/models_shelf.dart';

/// It is called on auth mode changes,
/// triggered by [Auth.switchAuth] method.
typedef AuthModeChangeCallback = void Function(AuthMode authMode);

class Auth with ChangeNotifier {
// if there is any error message.
  /// [Auth] is the provider for auth related data, functions.
  /// Manages the state related to the authentication modes.
  Auth({
    this.socialLogins = const <SocialLogin>[],
    this.onAuthModeChange,
    AuthMode? initialMode,
    LoginCallback? onLogin,
    SignupCallback? onSignup,
    ForgotPasswordCallback? onForgotPassword,
  }) {
    _onLogin = onLogin ?? _defaultLoginFunc;
    _onSignup = onSignup ?? _defaultSignupFunc;
    _onForgotPassword = onForgotPassword ?? _defaultForgotPassFunc;
    _mode = initialMode ?? AuthMode.login;
  }

  /// Default login, signup and forgot password functions to be
  /// called in case any custom functions are not provided.
  Future<String?> _defaultLoginFunc(LoginData a) async => null;
  Future<String?> _defaultSignupFunc(SignUpData a) async => null;
  Future<String?> _defaultForgotPassFunc(String e) async => null;
  final AuthModeChangeCallback? onAuthModeChange;

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
  late AuthMode _mode;
  AuthMode get mode => _mode;
  void notifySetMode(AuthMode value) {
    if (value.index != mode.index) {
      _mode = value;
      notifyListeners();
    }
  }

  /// Returns whether the current [_mode] is login or signup mode.
  bool get isLogin => _mode == AuthMode.login;
  bool get isSignup => _mode == AuthMode.signup;

  /// Switches the authentication mode and notify the listeners.
  AuthMode switchAuth() {
    if (mode == AuthMode.login) {
      notifySetMode(AuthMode.signup);
    } else if (mode == AuthMode.signup) {
      notifySetMode(AuthMode.login);
    }
    if (onAuthModeChange != null) onAuthModeChange!(mode);
    return mode;
  }

  /// Indicates whether the screen animation is reverse mode.
  bool isReverse = true;

  /// Username in the text controller.
  String? username;

  /// Email user entered in the text controller.
  String? email;

  /// Password text in the text controller.
  String? password;

  /// Confirm password text in the text controller.
  String? confirmPassword;

  void setUsername(String? newUsername) => username = newUsername;

  void setEmail(String? newEmail) => email = newEmail;

  void setPassword(String? newPassword) => password = newPassword;

  void setConfirmPassword(String? newConfirmPassword) =>
      confirmPassword = newConfirmPassword;
}
