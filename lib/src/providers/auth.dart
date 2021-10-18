import 'package:flutter/material.dart';

import '../constants/enums/auth_mode.dart';
import '../models/models_shelf.dart';

class Auth with ChangeNotifier {
  Auth({
    this.socialLogins = const <SocialLogin>[],
    LoginCallback? onLogin,
    SignupCallback? onSignup,
    ForgotPasswordCallback? onForgotPassword,
  }) {
    _onLogin = onLogin ?? defaultLoginFunc;
    _onSignup = onSignup ?? defaultSignupFunc;
    _onForgotPassword = onForgotPassword ?? defaultForgotPassFunc;
  }

  Future<String?> defaultLoginFunc(LoginData a) async => null;
  Future<String?> defaultSignupFunc(SignUpData a) async => null;
  Future<String?> defaultForgotPassFunc(String e) async => null;

  late final LoginCallback _onLogin;
  late final SignupCallback _onSignup;
  late final ForgotPasswordCallback _onForgotPassword;
  LoginCallback get onLogin => _onLogin;
  SignupCallback get onSignup => _onSignup;
  ForgotPasswordCallback get onForgotPassword => _onForgotPassword;

  final List<SocialLogin>? socialLogins;

  AuthMode _mode = AuthMode.login;

  AuthMode get mode => _mode;
  set mode(AuthMode value) {
    _mode = value;
    notifyListeners();
  }

  bool get isLogin => _mode == AuthMode.login;
  bool get isSignup => _mode == AuthMode.signup;

  AuthMode switchAuth() {
    if (mode == AuthMode.login) {
      mode = AuthMode.signup;
    } else if (mode == AuthMode.signup) {
      mode = AuthMode.login;
    }
    return mode;
  }
}
