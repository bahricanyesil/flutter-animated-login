import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../decorations/input_decorations.dart';
import '../../decorations/text_styles.dart';
import '../../providers/login_theme.dart';
import 'text_form_field_wrapper.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    required this.controller,
    required this.validator,
    this.hintText,
    this.prefixIcon,
    this.prefixWidget,
    this.backgroundColor,
    this.widthFactor,
    this.heightFactor,
    Key? key,
  }) : super(key: key);
  final TextEditingController controller;
  final String? Function(String?) validator;
  final String? hintText;
  final IconData? prefixIcon;
  final Widget? prefixWidget;
  final Color? backgroundColor;
  final double? widthFactor;
  final double? heightFactor;

  @override
  Widget build(BuildContext context) {
    final LoginTheme theme = context.read<LoginTheme>();
    return BaseTextFormFieldWrapper(
      formField: TextFormField(
        key: Key(controller.toString()),
        controller: controller,
        validator: theme.showFormFieldErrors ? validator : null,
        style: theme.textFormStyle ?? TextStyles(context).textFormStyle(),
        decoration: theme.textFormFieldDeco ?? _getFormDeco(context),
      ),
      widthFactor: widthFactor,
      heightFactor: heightFactor,
    );
  }

  InputDecoration _getFormDeco(BuildContext context) =>
      InputDeco(context).loginDeco(
        hintText: hintText,
        prefixIcon: prefixIcon,
        prefixWidget: prefixWidget,
      );
}
