import 'package:async/async.dart';
import 'package:flutter/material.dart';

import '../constants/enums/auth_mode.dart';
import '../models/models_shelf.dart';

/// It is called on auth mode changes,
/// triggered by [Auth.switchAuth] method.
typedef AuthModeChangeCallback = void Function(AuthMode authMode);

/// [Auth] is the provider for auth related data, functions.
class Auth extends ChangeNotifier {
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

  /// Callback to use auth mode changes.
  final AuthModeChangeCallback? onAuthModeChange;

  late final LoginCallback _onLogin;

  /// Function to be called on login action.
  LoginCallback get onLogin => _onLogin;

  late final SignupCallback _onSignup;

  /// Function to be called on signup action.
  SignupCallback get onSignup => _onSignup;

  late final ForgotPasswordCallback _onForgotPassword;

  /// Function to be called on click to forgot password text.
  ForgotPasswordCallback get onForgotPassword => _onForgotPassword;

  /// List of social login options.
  final List<SocialLogin>? socialLogins;

  late AuthMode _mode;

  /// Current authentication mode of the screen.
  AuthMode get mode => _mode;

  /// Uses [AuthMode] enum's values.
  void notifySetMode(AuthMode value) {
    if (value.index != mode.index) {
      _mode = value;
      notifyListeners();
    }
  }

  /// Returns whether the current [_mode] is login or signup mode.
  bool get isLogin => _mode == AuthMode.login;

  /// Returns whether the current [_mode] is login or signup mode.
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

  /// Sets the username.
  void setUsername(String? newUsername) => username = newUsername;

  /// Sets the email.
  void setEmail(String? newEmail) => email = newEmail;

  /// Sets the password.
  void setPassword(String? newPassword) => password = newPassword;

  /// Sets the confirm password.
  void setConfirmPassword(String? newConfirmPassword) =>
      confirmPassword = newConfirmPassword;

  /// Sets the confirm password.
  void setIsReverse(bool newValue) {
    if (newValue != isReverse) {
      isReverse = newValue;
      notifyListeners();
    }
  }

  /// Cancelable operation for auth operations.
  CancelableOperation<dynamic>? cancelableOperation;
}
