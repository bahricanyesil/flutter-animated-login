import 'login_data.dart';
import 'signup_data.dart';

/// The result should be the error message.
/// Returning null indicatest that the callback succeed.
typedef LoginCallback = Future<String?>? Function(LoginData);

/// The result should be the error message.
/// Returning null indicatest that the callback succeed.
typedef SignupCallback = Future<String?>? Function(SignUpData);

/// The result should be the error message.
/// Returning null indicatest that the callback succeed.
typedef ProviderAuthCallback = Future<String?>? Function();

/// The result should be the error message.
/// Returning null indicatest that the callback succeed.
typedef ForgotPasswordCallback = Future<String?>? Function(String);

class SocialLogin {
  final String iconPath;
  final ProviderAuthCallback callback;

  SocialLogin({
    required this.iconPath,
    required this.callback,
  });
}
