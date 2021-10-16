import 'package:flutter/material.dart';

import '../constants/enums/auth_mode.dart';
import '../models/social_login.dart';

class Auth with ChangeNotifier {
  Auth({
    this.socialLogins = const <SocialLogin>[],
    this.onLogin,
    this.onSignup,
    String email = '',
    String password = '',
    String confirmPassword = '',
  })  : _email = email,
        _password = password,
        _confirmPassword = confirmPassword;

  final AuthCallback? onLogin;
  final AuthCallback? onSignup;
  final List<SocialLogin> socialLogins;

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

  String _email = '';
  String get email => _email;
  set email(String email) {
    _email = email;
    notifyListeners();
  }

  String _password = '';
  String get password => _password;
  set password(String password) {
    _password = password;
    notifyListeners();
  }

  String _confirmPassword = '';
  String get confirmPassword => _confirmPassword;
  set confirmPassword(String confirmPassword) {
    _confirmPassword = confirmPassword;
    notifyListeners();
  }
}
