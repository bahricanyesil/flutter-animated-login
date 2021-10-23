import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../decorations/input_decorations.dart';
import '../../decorations/text_styles.dart';
import '../../providers/login_theme.dart';
import 'text_form_field_wrapper.dart';

/// Base [TextFormField] wrapped with [BaseTextFormFieldWrapper].
/// Implements login decoration as default, can be customized with parameteres.
/// Used for implementation of name and email text form fields.
class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    required this.controller,
    required this.validator,
    this.hintText,
    this.prefixIcon,
    this.prefixWidget,
    this.backgroundColor,
    this.widthFactor,
    this.textInputAction = TextInputAction.done,
    Key? key,
  }) : super(key: key);
  final TextEditingController controller;
  final String? Function(String?) validator;
  final String? hintText;
  final IconData? prefixIcon;
  final Widget? prefixWidget;
  final Color? backgroundColor;
  final double? widthFactor;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    final LoginTheme theme = context.read<LoginTheme>();
    return BaseTextFormFieldWrapper(
      formField: TextFormField(
        controller: controller,
        textInputAction: textInputAction,
        validator: theme.showFormFieldErrors ? validator : null,
        style: TextStyles(context).textFormStyle().merge(theme.textFormStyle),
        decoration: theme.textFormFieldDeco ?? _getFormDeco(context),
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
