import 'package:flutter/foundation.dart';

/// When user select a language, returns the corresponding language option.
typedef ChangeLanguageCallback = void Function(LanguageOption? language);

/// Will be called wen user taps to change language button.
/// Should return [LanguageOption] that user is selected.
typedef ChangeLangOnPressedCallback = LanguageOption? Function();

/// [LanguageOption] model is to store/transfer data of language options.
/// Contains [languageCode], [value], and [iconPath] fields.
@immutable
class LanguageOption {
  /// The complete name of the language option.
  final String value;

  /// The code/abbrevation of the language option.
  final String languageCode;

  /// Full asset path of the language option.
  /// Probably it will be the flag of a country.
  /// Ex: 'assets/images/google.png'
  final String? iconPath;

  const LanguageOption({
    required this.value,
    required this.languageCode,
    this.iconPath,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is LanguageOption &&
        other.value == value &&
        other.languageCode == languageCode;
  }

  /// This hashCode part is inspired from Quiver package.
  /// Quiver package link: https://pub.dev/packages/quiver
  @override
  int get hashCode => _finish(
        _combine(
          _combine(_combine(0, value.hashCode), languageCode.hashCode),
          iconPath.hashCode,
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
