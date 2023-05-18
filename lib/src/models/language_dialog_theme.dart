import 'package:flutter/material.dart';

/// Style related settings for choose language dialog.
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

  /// Title of the choose language dialog.
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

  /// Creates a copy animated dialog theme with the given parameters.
  LanguageDialogTheme copyWith({
    Widget? title,
    Size? dialogOptionSize,
    EdgeInsets? optionMargin,
    EdgeInsets? optionPadding,
    Color? selectedBackgroundColor,
    Color? iconColor,
    TextStyle? languageTextStyle,
    Color? selectedItemTextColor,
    DividerThemeData? dividerThemeData,
  }) =>
      LanguageDialogTheme(
        title: title ?? this.title,
        dialogOptionSize: dialogOptionSize ?? this.dialogOptionSize,
        optionMargin: optionMargin ?? this.optionMargin,
        optionPadding: optionPadding ?? this.optionPadding,
        selectedBackgroundColor:
            selectedBackgroundColor ?? this.selectedBackgroundColor,
        iconColor: iconColor ?? this.iconColor,
        languageTextStyle: languageTextStyle ?? this.languageTextStyle,
        selectedItemTextColor:
            selectedItemTextColor ?? this.selectedItemTextColor,
        dividerThemeData: dividerThemeData ?? this.dividerThemeData,
      );
}
