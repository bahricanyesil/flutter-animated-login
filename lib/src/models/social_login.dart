import 'package:flutter/foundation.dart';

import 'login_data.dart';
import 'signup_data.dart';

/// The result should be the error message.
/// Returning null indicatest that the callback succeed.
typedef LoginCallback = Future<String?> Function(LoginData loginData);

/// The result should be the error message.
/// Returning null indicatest that the callback succeed.
typedef SignupCallback = Future<String?> Function(SignUpData signUpData);

/// The result should be the error message.
/// Returning null indicatest that the callback succeed.
typedef SocialLoginCallback = Future<String?> Function();

/// The result should be the error message.
/// Returning null indicatest that the callback succeed.
/// It takes [email] as a parameter to identify the user.
typedef ForgotPasswordCallback = Future<String?> Function(String email);

@immutable

/// [SocialLogin] model is to store/transfer data of social login types.
class SocialLogin {
  /// Contains [iconPath], and [callback] fields.
  const SocialLogin({
    required this.iconPath,
    required this.callback,
  });

  /// Full asset path of the social platform logo.
  /// Ex: 'assets/images/google.png'
  final String iconPath;

  /// The callback will be called on click to logo of the social platform.
  final SocialLoginCallback callback;
}
