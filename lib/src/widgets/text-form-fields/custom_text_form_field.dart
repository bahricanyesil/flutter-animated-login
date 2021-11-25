import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../decorations/input_decorations.dart';
import '../../decorations/text_styles.dart';
import '../../providers/login_theme.dart';
import 'text_form_field_wrapper.dart';

class CustomTextFormField extends StatelessWidget {
  /// Base [TextFormField] wrapped with [BaseTextFormFieldWrapper].
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
    this.focusNode,
    Key? key,
  }) : super(key: key);
  final TextEditingController controller;
  final FormFieldValidator<String?>? validator;
  final void Function(String? text) onChanged;
  final String? hintText;
  final IconData? prefixIcon;
  final Widget? prefixWidget;
  final Color? backgroundColor;
  final double? widthFactor;
  final TextInputAction textInputAction;
  final Iterable<String> autofillHints;
  final TextInputType? textInputType;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    final LoginTheme theme = context.read<LoginTheme>();
    return BaseTextFormFieldWrapper(
      formField: TextFormField(
        focusNode: focusNode,
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
