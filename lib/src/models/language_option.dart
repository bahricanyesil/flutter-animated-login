import 'package:flutter/foundation.dart';

/// When user select a language, returns the language name provided.
typedef ChangeLanguageCallback = void Function(String?);

/// Will be called wen user taps to change language button.
/// Should return [LanguageOption] that user is selected.
typedef ChangeLangOnPressedCallback = LanguageOption? Function();

/// [LanguageOption] model is to store/transfer data of language options.
/// Contains [iconPath], and [language] fields.
@immutable
class LanguageOption {
  /// The abbrevation of the language option.
  final String languageAbbr;

  /// The complete name of the language option.
  final String language;

  /// Full asset path of the language option.
  /// Probably it will be the flag of a country.
  /// Ex: 'assets/images/google.png'
  final String? iconPath;

  const LanguageOption({
    required this.languageAbbr,
    required this.language,
    this.iconPath,
  });
}
