import 'package:flutter/foundation.dart';

import 'login_data.dart';
import 'signup_data.dart';

/// The result should be the error message.
/// Returning null indicatest that the callback succeed.
typedef LoginCallback = Future<String?> Function(LoginData);

/// The result should be the error message.
/// Returning null indicatest that the callback succeed.
typedef SignupCallback = Future<String?> Function(SignUpData);

/// The result should be the error message.
/// Returning null indicatest that the callback succeed.
typedef SocialLoginCallback = Future<String?> Function();

/// The result should be the error message.
/// Returning null indicatest that the callback succeed.
/// It takes [email] as a parameter to identify the user.
typedef ForgotPasswordCallback = Future<String?> Function(String email);

/// [SocialLogin] model is to store/transfer data of social login types.
/// Contains [iconPath], and [callback] fields.
@immutable
class SocialLogin {
  /// [iconPath] is the full assets path of social platform logo.
  /// Ex: 'assets/images/google.png'
  final String iconPath;

  /// [callback] is the callback will be performed when clicked.
  final SocialLoginCallback callback;

  const SocialLogin({
    required this.iconPath,
    required this.callback,
  });
}
