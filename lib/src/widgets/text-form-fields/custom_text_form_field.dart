import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../decorations/input_decorations.dart';
import '../../decorations/text_styles.dart';
import '../../providers/login_theme.dart';
import '../../providers/providers_shelf.dart';
import 'text_form_field_wrapper.dart';

/// Base [TextFormField] wrapped with [BaseTextFormFieldWrapper].
class CustomTextFormField extends StatelessWidget {
  /// Implements login decoration as default, can be customized with params.
  /// Used for implementation of name and email text form fields.
  const CustomTextFormField({
    required this.controller,
    required this.validator,
    required this.onChanged,
    this.hintText,
    this.prefixIcon,
    this.prefixWidget,
    this.backgroundColor,
    this.widthFactor,
    this.textInputAction = TextInputAction.done,
    this.autofillHints = const <String>[],
    this.textInputType,
    Key? key,
  }) : super(key: key);

  /// Controller for the text form field.
  final TextEditingController controller;

  /// Validator of the text field.
  final FormFieldValidator<String?>? validator;

  /// Callback to call on text change.
  final void Function(String? text) onChanged;

  /// Hint text of the field.
  final String? hintText;

  /// Prefix icon.
  final IconData? prefixIcon;

  /// Custom prefix widget.
  final Widget? prefixWidget;

  /// Background color of the field.
  final Color? backgroundColor;

  /// Width factor.
  final double? widthFactor;

  /// Custom text input action.
  final TextInputAction textInputAction;

  /// Custom list of auto fill hints.
  final Iterable<String> autofillHints;

  /// Custom text input type.
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    final LoginTheme theme = context.read<LoginTheme>();
    return BaseTextFormFieldWrapper(
      formField: TextFormField(
        controller: controller,
        textInputAction: textInputAction,
        validator: validator,
        style: TextStyles(context).textFormStyle().merge(theme.textFormStyle),
        decoration: theme.textFormFieldDeco ?? _getFormDeco(context),
        onChanged: onChanged,
        autofillHints: autofillHints,
        keyboardType: textInputType,
      ),
      widthFactor: widthFactor,
    );
  }

  InputDecoration _getFormDeco(BuildContext context) =>
      InputDeco(context).loginDeco(
        hintText: hintText,
        prefixIcon: prefixIcon,
        prefixWidget: prefixWidget,
      );
}
