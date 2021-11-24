import 'package:flutter/material.dart';

class LanguageDialogTheme {
  /// Style related settings for choose language dialog.
  const LanguageDialogTheme({
    this.title,
    this.dialogOptionSize,
    this.optionMargin,
    this.optionPadding,
    this.selectedBackgroundColor,
    this.iconColor,
    this.languageTextStyle,
    this.selectedItemTextColor,
    this.dividerThemeData,
  });

  /// Title of the choose langauge dialog.
  final Widget? title;

  /// Size of the dialog option.
  final Size? dialogOptionSize;

  /// Margin of dialog option.
  final EdgeInsets? optionMargin;

  /// Padding of dialog option.
  final EdgeInsets? optionPadding;

  /// Background color of the selected option.
  final Color? selectedBackgroundColor;

  /// Color of the language icon.
  final Color? iconColor;

  /// Text style for language text.
  final TextStyle? languageTextStyle;

  /// Text color for selected language item.
  final Color? selectedItemTextColor;

  /// Theme for divider between language options.
  final DividerThemeData? dividerThemeData;
}
