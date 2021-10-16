import 'package:flutter/foundation.dart';

@immutable
class AuthData {
  final String name;
  final String password;

  const AuthData({
    required this.name,
    required this.password,
  });

  @override
  String toString() => 'LoginData($name, $password)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is AuthData &&
        other.name == name &&
        other.password == password;
  }

  /// This hashCode part is inspired from Quiver package.
  /// Quiver package link: https://pub.dev/packages/quiver
  @override
  int get hashCode =>
      _finish(_combine(_combine(0, name.hashCode), password.hashCode));

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
