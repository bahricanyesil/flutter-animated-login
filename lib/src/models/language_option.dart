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
}
