import 'package:flutter/foundation.dart';

import '../utils/hasher.dart';

@immutable

/// [SignUpData] model is to store/transfer signup mode data.
class SignUpData {
  /// Contains [name], [email], [password] and [confirmPassword] fields.
  /// Overrides [toString], [hashCode] methods and [==] operator.
  const SignUpData({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  /// Name of the user
  final String name;

  /// Email of the user
  final String email;

  /// Password of the user
  final String password;

  /// Confirm password user entered
  final String confirmPassword;

  /// Overrides the [toString] method.
  @override
  String toString() => 'SignUpData($name, $email, $password, $confirmPassword)';

  /// Overrides the equality operator.
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
