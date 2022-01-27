import 'package:flutter/material.dart';

import 'language_dialog_theme.dart';

/// Style related settings for "CustomDialog",
/// that will be used on dialog displays.
class AnimatedDialogTheme {
  /// Default constructor for the [AnimatedDialogTheme].
  const AnimatedDialogTheme({
    this.contentPadding,
    this.actionsPadding,
    this.contentSize,
    this.contentTextStyle,
    this.contentTextAlign,
    this.actionTextStyle,
    this.onPressed,
    this.contentBoxConstraints,
    this.shape,
    this.elevation,
    this.backgroundColor,
    this.animationDuration,
    this.languageDialogTheme,
    this.titleStyle,
  });

  /// The padding for content of the dialogs.
  final EdgeInsets? contentPadding;

  /// The padding for actions of the dialogs.
  final EdgeInsets? actionsPadding;

  /// Size of the content widget.
  final Size? contentSize;

  /// Text style of the content text.
  final TextStyle? contentTextStyle;

  /// Text alignment of the content text.
  final TextAlign? contentTextAlign;

  /// Text style of the action text.
  final TextStyle? actionTextStyle;

  /// Action will be performed on click to action button of the dialog.
  final VoidCallback? onPressed;

  /// Box constraints, size limitations of the content widget, if any.
  /// Limits their size acc. to width and height.
  final BoxConstraints? contentBoxConstraints;

  /// Shape of the dialog.
  final ShapeBorder? shape;

  /// Elevation of the dialog.
  final double? elevation;

  /// Background color of the dialog.
  final Color? backgroundColor;

  /// Duration of display animation of the dialog.
  final Duration? animationDuration;

  /// Theme of language dialog. Determines its style
  /// with the help of [LanguageDialogTheme].
  final LanguageDialogTheme? languageDialogTheme;

  /// Text style of the title.
  final TextStyle? titleStyle;

  /// Creates a copy animated dialog theme with the given parameters.
  AnimatedDialogTheme copyWith({
    EdgeInsets? contentPadding,
    EdgeInsets? actionsPadding,
    Size? contentSize,
    TextStyle? contentTextStyle,
    TextAlign? contentTextAlign,
    TextStyle? actionTextStyle,
    VoidCallback? onPressed,
    BoxConstraints? contentBoxConstraints,
    ShapeBorder? shape,
    double? elevation,
    Color? backgroundColor,
    Duration? animationDuration,
    LanguageDialogTheme? languageDialogTheme,
    TextStyle? titleStyle,
  }) =>
      AnimatedDialogTheme(
        actionTextStyle: actionTextStyle ?? this.actionTextStyle,
        actionsPadding: actionsPadding ?? this.actionsPadding,
        animationDuration: animationDuration ?? this.animationDuration,
        backgroundColor: backgroundColor ?? this.backgroundColor,
        contentBoxConstraints:
            contentBoxConstraints ?? this.contentBoxConstraints,
        contentPadding: contentPadding ?? this.contentPadding,
        contentSize: contentSize ?? this.contentSize,
        contentTextAlign: contentTextAlign ?? this.contentTextAlign,
        contentTextStyle: contentTextStyle ?? this.contentTextStyle,
        elevation: elevation ?? this.elevation,
        languageDialogTheme: languageDialogTheme ?? this.languageDialogTheme,
        onPressed: onPressed ?? this.onPressed,
        shape: shape ?? this.shape,
        titleStyle: titleStyle ?? this.titleStyle,
      );
}
