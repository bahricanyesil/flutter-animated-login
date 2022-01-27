import 'package:flutter/foundation.dart';

import '../utils/hasher.dart';

/// When user select a language, returns the corresponding language option.
typedef ChangeLanguageCallback = void Function(LanguageOption? language);

/// Will be called wen user taps to change language button.
/// Should return [LanguageOption] that user is selected.
typedef ChangeLangOnPressedCallback = Future<LanguageOption?> Function();

@immutable

/// [LanguageOption] model is to store/transfer data of language options.
class LanguageOption {
  /// * Contains [code], [value], and [iconPath] fields.
  const LanguageOption({
    required this.value,
    required this.code,
    this.iconPath,
  });

  /// The complete name of the language option.
  final String value;

  /// The code/abbrevation of the language option.
  final String code;

  /// Full asset path of the language option.
  /// Probably it will be the flag of a country.
  /// Ex: 'assets/images/google.png'
  final String? iconPath;

  /// Overrides the equality operator.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is LanguageOption &&
        other.value == value &&
        other.code == code;
  }

  /// This hashCode part is inspired from Quiver package.
  /// Quiver package link: https://pub.dev/packages/quiver
  @override
  int get hashCode => Hasher.getHashCode(<String>[value, code]);
}
