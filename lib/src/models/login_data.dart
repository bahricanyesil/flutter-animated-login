import 'package:flutter/foundation.dart';

import '../utils/hasher.dart';

/// [LoginData] model is to store/transfer login mode data.
/// Contains [email] and [password] fields.
/// Overrides [toString], [hashCode] methods and [==] operator.
@immutable
class LoginData {
  final String email;
  final String password;

  const LoginData({
    required this.email,
    required this.password,
  });

  @override
  String toString() => 'LoginData($email, $password)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is LoginData &&
        other.email == email &&
        other.password == password;
  }

  /// This hashCode part is inspired from Quiver package.
  /// Quiver package link: https://pub.dev/packages/quiver
  @override
  int get hashCode => Hasher.getHashCode(<String>[email, password]);
}
