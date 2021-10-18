import 'package:flutter/foundation.dart';

@immutable
class SignUpData {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  const SignUpData({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  @override
  String toString() => 'SignUpData($name, $email, $password, $confirmPassword)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is SignUpData &&
        other.name == name &&
        other.email == email &&
        other.password == password &&
        other.confirmPassword == confirmPassword;
  }

  /// This hashCode part is inspired from Quiver package.
  /// Quiver package link: https://pub.dev/packages/quiver
  @override
  int get hashCode => _finish(
        _combine(
          _combine(_combine(_combine(0, name.hashCode), email.hashCode),
              password.hashCode),
          confirmPassword.hashCode,
        ),
      );

  int _combine(int hash, int value) {
    int newHash = 0x1fffffff & (hash + value);
    newHash = 0x1fffffff & (newHash + ((0x0007ffff & newHash) << 10));
    return newHash ^ (newHash >> 6);
  }

  int _finish(int hash) {
    int newHash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    newHash = newHash ^ (newHash >> 11);
    return 0x1fffffff & (newHash + ((0x00003fff & newHash) << 15));
  }
}
