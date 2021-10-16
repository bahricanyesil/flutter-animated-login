import 'auth_data.dart';

/// The result should be the error message.
/// Returning null indicatest that the callback succeed.
typedef AuthCallback = Future<String?>? Function(AuthData);

/// The result should be the error message.
/// Returning null indicatest that the callback succeed.
typedef ProviderAuthCallback = Future<String?>? Function();

class SocialLogin {
  final String iconPath;
  final ProviderAuthCallback callback;

  SocialLogin({
    required this.iconPath,
    required this.callback,
  });
}
