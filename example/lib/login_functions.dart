import 'package:animated_login/animated_login.dart';
import 'package:flutter/material.dart';

import 'dialog_builders.dart';

class LoginFunctions {
  const LoginFunctions(this.context);
  final BuildContext context;

  /// Login action that will be performed on click to action button in login mode.
  Future<String?> onLogin(LoginData loginData) async {
    DialogBuilders(context).showLoadingDialog();
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pop();
    DialogBuilders(context).showResultDialog('Successful login.');
    return null;
  }

  /// Sign up action that will be performed on click to action button in sign up mode.
  Future<String?> onSignup(SignUpData signupData) async {
    DialogBuilders(context).showLoadingDialog();
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pop();
    DialogBuilders(context).showResultDialog('Successful sign up.');
    return null;
  }

  /// Social login callback example.
  Future<String?> socialLogin(String type) async {
    DialogBuilders(context).showLoadingDialog();
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pop();
    DialogBuilders(context)
        .showResultDialog('Successful social login with $type.');
    return null;
  }

  /// Action that will be performed on click to "Forgot Password?" text/CTA.
  /// Probably you will navigate user to a page to create a new password after the verification.
  Future<String?> onForgotPassword(String email) async {
    DialogBuilders(context).showLoadingDialog();
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pop();
    Navigator.of(context).pushNamed('/forgotPass');
    return null;
  }
}
