import 'package:flutter/foundation.dart';

import '../utils/hasher.dart';

/// [String] model is to store/transfer signup mode data.
/// Contains [name], [email], [password] and [confirmPassword] fields.
/// Overrides [toString], [hashCode] methods and [==] operator.
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
  int get hashCode =>
      Hasher.getHashCode(<String>[email, name, password, confirmPassword]);
}
